require 'swagger_helper'

describe 'Semesters API' do
  path '/api/v1/semesters' do
    post 'Creates a semester' do
      tags 'Semesters'
      consumes 'application/json', 'application/xml'
      parameter name: :semester, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          credits: { type: :string },
          start_date: { type: :string },
          end_date: { type: :string }
        },
        required: ['name' ]
      }

      response '201', 'semester created' do
        let(:semester) { { name: 'Semester 1', credits: '10.0', start_date: "20/6/2019", end_date: "20/6/2020" } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:semester) { { name: nil } }
        run_test!
      end
    end
  end

  path '/api/v1/semesters/{id}' do
    get 'Retrieves a semester' do
      tags 'Semesters'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string
      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, }
          },
          required: [ 'id']

        let(:id) { Pet.create(name: 'semester 1', credits: '10.0', start_date: '20/6/2019').id }
        run_test!
      end

      response '404', 'semester not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/semesters' do
    get 'Retrieves all semester' do
      tags 'Semesters'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string
      response '200', 'return all semester' do
        let(:semesters) { Pet.create(name: 'semester 1', credits: '10.0', start_date: '20/6/2019') }
        run_test!
      end
    end
  end
end