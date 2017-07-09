describe App do
  it { should have_valid(:user_id).when(1, 2) }
  it { should_not have_valid(:user_id).when(nil, '') }

  it { should have_valid(:pet_id).when(1,2) }
  it { should_not have_valid(:pet_id).when(nil, '') }
end
