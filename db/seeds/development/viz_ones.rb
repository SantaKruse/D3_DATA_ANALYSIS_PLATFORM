def setup
  VizOne.all.destroy_all
end

def create
  20000.times do
    VizOne.create!(
      year: [2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018].sample,
      age: rand(100),
      ethnicity: ['White', 'Asian or Asian British', 'Black or Black British', 'Mixed', 'Other Ethnic Groups'].sample,
      sex: ['Male', 'Female'].sample,
      diabetes_type: ['Type 1', 'Type 2', 'GDM', 'Other'].sample,
      deprivation: rand(10),
      ccg: ['Southwark', 'Lambeth'].sample,
      baseline_group: ['ckd stage 1', 'ckd stage 2', 'ckd stage 3'].sample,
      hba1c: (rand * 100).round(1),
      egfr: (rand * 100).round(1),
      chol: (rand * 100).round(1),
      bmi: (rand * 100).round(1),
      bp: (rand * 100).round(1)
    )
  end

end

setup
create

