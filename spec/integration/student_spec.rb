require 'swagger_helper'

describe 'Students API' do
  path '/api/v1/semesters/:semester_id/students' do
    post 'Creates a student' do
      tags 'Students'
      consumes 'application/json', 'application/xml'
      parameter name: :student, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          dob: { type: :string }
        },
        required: ['name' ]
      }

      response '201', 'student created' do
        let(:student) { { name: 'Student 1', description: 'first student', dob: "20/6/1993"} }
        run_test!
      end

      response '422', 'invalid request' do
        let(:student) { { name: nil } }
        run_test!
      end
    end
  end

  path '/api/v1/semesters/:semester_id/students/{id}' do
    get 'Retrieves a student' do
      tags 'Students'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string
      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, }
          },
          required: [ 'id']

        let(:id) { Pet.create(name: 'student 1').id }
        run_test!
      end

      response '404', 'student not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/semesters/:semester_id/students' do
    get 'Retrieves all student' do
      tags 'Students'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string
      response '200', 'return all student' do
        let(:students) { Pet.create(name: 'student 1', credits: '10.0', start_date: '20/6/2019') }
        run_test!
      end
    end
  end
end