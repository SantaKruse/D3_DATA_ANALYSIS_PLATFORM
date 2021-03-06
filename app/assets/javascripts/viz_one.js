$(document).ready(function() {

  var w = 900;
  var h = 600;
  var margin = {
    top: 100,
    bottom: 100,
    left: 100,
    right: 100
  };
  var width = w - margin.left - margin.right;
  var height = h - margin.top - margin.bottom;
  var svg = d3.select(".plot-item").append("svg")
        .attr("id", "chart")
          .attr("width", w)
        .attr("height", h);
  var chart = svg.append("g")
        .classed("display", true)
        .attr("transform", "translate(" + margin.left + ", " + margin.top + ")");
  var colorScale = d3.scaleOrdinal(d3.schemeCategory10);
  var x = d3.scaleLinear()
        .range([0,width]);
  var y = d3.scaleLinear()
        .range([height,0]);
  var xAxis = d3.axisBottom(x);
  var xGridlines = d3.axisBottom(x)
        .tickSize(-height, -height)
        .tickFormat("");
  var yAxis = d3.axisLeft(y)
        .ticks(10)
        .tickSize(5)
        .tickFormat(function(d){
          return d.toFixed(0);
        });

  var yGridlines = d3.axisLeft(y)
        .tickSize(-width,0,0)
        .tickFormat("");
  var responseScale = d3.scaleLinear()
        .range([10,70]);

  var intialised

  $(document)
  .on('change', '.input_radio, .input_checkbox, .year-box', function() {
    filterLists()
  })

   $(document)
  .on('click', '.btn', function() {
    filterLists()
  })

  filterLists()

  function filterLists() {
    var form = $('#filter_form')
    $.ajax({
      url: form.attr('action'),
      type: 'post',
      data: form.serialize(),
      dataType: 'json',
      success: function(response) {
        vizOne(response)
      }
    })
  }

  function vizOne(data){

    function drawAxis(params){
      //if first load
      if(!params.intialise){
        this.append("g")
          .classed("gridline x", true)
          .attr("transform", "translate(0,"+ height +")")
          .call(params.axis.gridLines.x);
        this.append("g")
          .classed("gridline y", true)
          .attr("transform", "translate(0,0)")
          .call(params.axis.gridLines.y);
        this.append("g")
          .classed("axis x", true)
          .attr("transform", "translate(0,"+ height +")")
          .call(params.axis.x);
        this.append("g")
          .classed("axis y", true)
          .attr("transform", "translate(0,0)")
          .call(params.axis.y);
        this.select(".y.axis")
          .append("text")
          .classed("y axis-label", true)
          .attr("transform", "translate(" + -56  +"," + height/2 + ") rotate(-90)")
          .text("HbA1c");
        this.select(".x.axis")
          .append("text")
          .classed("x axis-label", true)
          .attr("transform", "translate(" + width/2 + "," + 48 + ")")
          .text("Patient age"); 
        this.append("g")
          .append("text")
          .classed("chart-header", true)
          .attr("transform", "translate(0,-24)")
          .text("");  
      }
      else{
        x.domain(params.extents.extentX);
        y.domain(params.extents.extentY);

        d3.select(".x.axis")
        .transition()
        .call(params.axis.x);
        d3.select(".y.axis")
        .transition()
        .call(params.axis.y);

        d3.select(".gridline.x")
        .transition()
        .call(params.axis.gridLines.x);
        d3.select(".gridline.y")
        .transition()
        .call(params.axis.gridLines.y);
      };
    };


    function plot(params){
      //set starting bands
      var self = this;

      x.domain(params.extents.extentX);
      y.domain(params.extents.extentY);

      responseScale.domain(d3.extent(params.data,function(d){
        return +d.count_value;
      }));

      colorScale.domain(params.grouping_list.map(function(d){
        return d
      }))

      //draw axis
      drawAxis.call(this,params); 

      //enter for <g>
      this.selectAll(".result_group")
        .data(params.grouping_list, function(d){
          return d;
        })
        .enter()
          .append("g")
          .attr("class", function(d){
            return 'group_' + d;
          })
          .classed("result_group", true);

      //update for <g>
      this.selectAll(".result_group")
        .style("fill", function(d,i){
          return colorScale(d);
        });

      //exit for g
      this.selectAll(".result_group")
        .data(params.grouping_list, function(d){
          return 'group_' + d
        })
        .exit()
        .remove();
      
      // //loop starting band group
      params.grouping_list.forEach(function(grouping_value){
        var g = self.selectAll("g." + "group_" + grouping_value);
        var dataset = params.data.filter(function(d){
          if(d.grouping_value == grouping_value){
            return true;
          }
        });

        //enter for result
        g.selectAll(".result")
          .data(dataset, function(d){
            return d.id_value;
          })
          .enter()
            .append("circle")
            .classed("result", true)
            .attr("opacity", 0);
        
        //update for result
        //circle

        g.selectAll(".result")
          .transition()
          .ease(d3.easeCubic) 
          .duration(2000)
          .attr("r", function(d){
            return 5;
          })
          .attr("cx", function(d){
            return x(+d.x_value);
          })
          .attr("cy", function(d){
            return y(+d.y_value);

          })
          .attr("key", function(d){
            return d.id_value;
          })
          .attr("opacity", 1);
          

        //exit for result
        g.selectAll(".result")
          .data(dataset, function(d){
            return d.id_value;
          })
          .exit()
          .transition().duration(2000).style("opacity", 0)
          .remove();
      });
    };

function intialised_state(){
  if (!intialised) {
    intialised = true
    return false
  } 
  else {
    return true
  }
}
function grouping_list(data){
  var groups = []
  data.forEach(function(row){
    if(!groups.includes(row.grouping_value)){
      groups.push(row.grouping_value)
    }
  })
  return groups;
};

function prep_plot(data){
  console.log(data)
  var grouping_data = grouping_list(data)
  var intialise_data = intialised_state()
  var extent_data = {age:[0,100], hba1c: [20,160], chol: [0,10], egfr: [0,200], bmi: [10,60], bp: [80,200]}
  var xVal = data[0].x_name
  var yVal = data[0].y_name
  var extentArrayX = extent_data[xVal]
  var extentArrayY = extent_data[yVal]

  plot.call(chart,{
    data: data,
    axis: {
      x: xAxis,
      y: yAxis,
      gridLines:{
        y: yGridlines,
        x: xGridlines
      }
    },
    grouping_list: grouping_data,
    extents: {
      extentX: extentArrayX,
      extentY: extentArrayY
    },
    intialise: intialise_data
  });   
};

prep_plot(data)



  } 
})

