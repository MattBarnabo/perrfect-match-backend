require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "returns an HTTPS status of success" do
      get cats_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    it "return an HTTPS status of success and creates a valid cat" do
      post cats_path, params: {
        cat: {
        name: 'Test cat',
        age: 10,
        enjoys: 'Eating fish by the dock.',
        image: 'https://images.unsplash.com/photo-1533738363-b7f9aef128ce?q=80&w=2835&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
        }
      }
      cat = Cat.where(name: 'Test cat').first
      expect(cat.valid?).to eq(true)
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH /update" do
    it "returns an HTTPS status of success making valid updates to a cat" do
      post cats_path, params: {
        cat: {
        name: 'Test cat',
        age: 10,
        enjoys: 'Eating fish by the dock.',
        image: 'https://images.unsplash.com/photo-1533738363-b7f9aef128ce?q=80&w=2835&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
        }
      }
      cat = Cat.where(name: 'Test cat').first
      patch cat_path(cat), params: {
      cat: {
        name: 'Test cat for patch',
        age: 7,
        enjoys: 'Eating fish by the dock with his cat gang.',
        image: 'https://images.unsplash.com/photo-1495360010541-f48722b34f7d?q=80&w=2836&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
        }
      }
      cat = Cat.where(name: 'Test cat for patch').first
      expect(cat.name).to eq('Test cat for patch')
      expect(cat.age).to eq(7)
      expect(cat.enjoys).to eq('Eating fish by the dock with his cat gang.')
      expect(cat.image).to eq('https://images.unsplash.com/photo-1495360010541-f48722b34f7d?q=80&w=2836&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
      expect(response).to have_http_status(200)
    end
    it'returns a http status response error when making invalid updates to a cat' do
      post cats_path, params: {
      cat: {
        name: 'Test cat for patch',
        age: 7,
        enjoys: 'Eating fish by the dock with his cat gang.',
        image: 'https://images.unsplash.com/photo-1495360010541-f48722b34f7d?q=80&w=2836&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
        }
      }
      cat = Cat.where(name: 'Test cat for patch').first
      patch cat_path(cat), params: {
        cat: {
        name: nil,
        age: nil,
        enjoys: nil,
        image: nil
        }
      }
      cat = Cat.where(name: nil).first
      expect(cat).to eq(nil)
      expect(response).to have_http_status(422)
    end
  end

  describe "DELETE #destroy" do
  it 'deletes the cat' do
    cat = Cat.create(
      name: 'Test cat for delete request',
      age: 7,
      enjoys: 'Test for enjoys attribute',
      image: 'https://images.unsplash.com/photo-1495360010541-f48722b34f7d?q=80&w=2836&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      )
    delete cat_path(cat)
    cat = Cat.where(name: 'Test cat for delete request').first
    expect(cat).to eq(nil)
    end
  end
end