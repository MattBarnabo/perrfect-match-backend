require 'rails_helper'

RSpec.describe Cat, type: :model do
  it 'is valid with valid attributes' do
    cat = Cat.create(
      name: 'Test Cat',
      age: 2,
      enjoys: 'test enjoys attribute',
      image: 'https://images.unsplash.com/photo-1591271305449-8bc2c57b06ab?q=80&w=2835&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    )
    expect(cat).to be_valid
  end
  # Name presence validation
  it 'is not be vaild without a name attribute' do
    cat = Cat.create(
      age: 5,
      enjoys: 'test enjoys attribute',
      image: 'https://images.unsplash.com/photo-1591271305449-8bc2c57b06ab?q=80&w=2835&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    )
    expect(cat).not_to be_valid
    expect(cat.errors[:name].first).to eq("can't be blank")
  end

  # Age Presence validation
  it 'is not valid without an age attribute' do
    cat = Cat.create(
      name: 'Sam',
      enjoys: 'test enjoys attribute',
      image: 'https://images.unsplash.com/photo-1591271305449-8bc2c57b06ab?q=80&w=2835&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    )
    expect(cat).not_to be_valid
    expect(cat.errors[:age].first).to eq("can't be blank")
  end

  # Enjoys presence validation
  it 'it is not valid without an enjoys attribute ' do
    cat = Cat.create(
      name: 'Sam',
      age: 5,
      image: 'https://images.unsplash.com/photo-1591271305449-8bc2c57b06ab?q=80&w=2835&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    )
    expect(cat).not_to be_valid
    expect(cat.errors[:enjoys].first).to eq("can't be blank")
  end

  # Image presence validation
  it 'is not valid without an image attribute' do
    cat = Cat.create(
      name: 'Sam',
      age: 5,
      enjoys: 'test enjoys attribute'
    )
    expect(cat).not_to be_valid
    expect(cat.errors[:image]).to eq("can't be blank")
  end

  # Enjoys minimum 10 characters validation
  it 'is not valid if enjoys is less than 10 characters' do
    cat = Cat.create(
      name: 'Sam',
      age: 5,
      enjoys: 'test enjoys attribute',
      image: 'https://images.unsplash.com/photo-1591271305449-8bc2c57b06ab?q=80&w=2835&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    )
    expect(cat).not_to be_valid
    expect(cat.errors[:enjoys].first).to eq('is too short (minimum is 10 characters)')
  end
end
