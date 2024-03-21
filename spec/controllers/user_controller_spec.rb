# spec/controllers/posts_controller_spec.rb

require 'rails_helper'

RSpec.describe UserController, type: :controller do
  describe 'GET /signup' do
    context 'happy path' do
      it 'returns sign up form' do
        get :index
        expect(response).to render_template(:signup)
      end
    end
  end

  describe 'POST /signup' do
    context 'happy path' do
      it 'creates user successfully and able to retrieve' do
        expect {
            post :create, params: {
                user: {
                   name: 'john doe', email: 'email@email.com', password: '123456', password_confirmation: '123456'   
                }
            }
        }.to change(User, :count).by(1)

        expect(response).to redirect_to(signup_path)
        expect(flash[:notice]).to be_present
      end
    end
    context 'sad path' do
      it 'invalid params, e.g. missing email' do
        expect {
            post :create, params: {
                user: {
                   name: 'john doe', email: '', password: '123456', password_confirmation: '123456'   
                }
            }
        }.not_to change(User, :count)

        expect(response).to render_template(:signup)
        expect(assigns(:user).errors).not_to be_nil
        expect(assigns(:user).errors.full_messages).to include("Email is invalid")
      end
      it 'invalid params, e.g. invalid email' do
        expect {
            post :create, params: {
                user: {
                   name: 'john doe', email: 'not a valid email', password: '123456', password_confirmation: '123456'   
                }
            }
        }.not_to change(User, :count)

        expect(response).to render_template(:signup)
        expect(assigns(:user).errors).not_to be_nil
        expect(assigns(:user).errors.full_messages).to include("Email is invalid")
      end
      it 'e.g. duplicated email' do
        # create first user with email@email.com
        post :create, params: {
            user: {
               name: 'john doe', email: 'email@email.com', password: '123456', password_confirmation: '123456'   
            }
        }

        # create another user with same email
        expect {
            post :create, params: {
                user: {
                  name: 'john doe 2', email: 'email@email.com', password: '123456', password_confirmation: '123456'   
                }
            }
        }.to raise_error(Exception, /duplicate key value violates unique constraint \"index_users_on_email\"/)
      end
    end
  end
end
