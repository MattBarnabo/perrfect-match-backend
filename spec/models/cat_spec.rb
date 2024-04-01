require 'rails_helper'
# cat = Cat.create(name:'Sam', age:5, enjoys:'long walks on the beach', image: 'https://images.unsplash.com/photo-1591271305449-8bc2c57b06ab?q=80&w=2835&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')


RSpec.describe Cat, type: :model do
  # Name presence validation
  it 'should validate name'do
    cat = Cat.create(
      age:5,
      enjoys:'long ',
      image: 'https://images.unsplash.com/photo-1591271305449-8bc2c57b06ab?q=80&w=2835&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D' )
    expect(cat.errors[:name]).to_not be_empty
  end

  # Age Presence validation
  it 'should validate name'do
  cat = Cat.create(
    name:'Sam',
    enjoys:'long ',
    image: 'https://images.unsplash.com/photo-1591271305449-8bc2c57b06ab?q=80&w=2835&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
    expect(cat.errors[:age]).to_not be_empty
  end

  # Enjoys presence validation
  it 'should validate name'do
  cat = Cat.create(
    name:'Sam',
    age:5,
    image: 'https://images.unsplash.com/photo-1591271305449-8bc2c57b06ab?q=80&w=2835&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
    expect(cat.errors[:enjoys]).to_not be_empty
  end

  # Image presence validation
  it 'should validate name'do
  cat = Cat.create(
    name:'Sam',
    age:5,
    enjoys:'long ')
    expect(cat.errors[:image]).to_not be_empty
  end

  # Enjoys minimum 10 characters validation
  it 'is not valid if enjoys is less than 10 characters'do
    cat = Cat.create(
      name:'Sam',
      age:5,
      enjoys:'l',
      image: 'https://images.unsplash.com/photo-1591271305449-8bc2c57b06ab?q=80&w=2835&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
    expect(cat.errors[:enjoys]).to_not be_empty
  end
end
