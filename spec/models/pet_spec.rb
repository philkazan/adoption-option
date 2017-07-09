describe Pet do
  it { should have_valid(:name).when('Jiffy', 'Chewy') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:animal).when('Dog', 'Cat') }
  it { should_not have_valid(:animal).when(nil, '') }

  it { should have_valid(:size).when('Small', 'Medium') }
  it { should_not have_valid(:size).when(nil, '') }

  it { should have_valid(:sex).when('Male', 'Female') }
  it { should_not have_valid(:sex).when(nil, '') }

  it { should have_valid(:location).when('08226', '19103') }
  it { should_not have_valid(:location).when(nil, '') }

  it { should have_valid(:age).when('Male', 'Female') }
  it { should_not have_valid(:age).when(nil, '') }

  it { should have_valid(:image).when('Male', 'Female') }
  it { should_not have_valid(:image).when(nil, '') }

  it { should have_valid(:description).when('Male', 'Female') }
  it { should_not have_valid(:description).when(nil, '') }

end
