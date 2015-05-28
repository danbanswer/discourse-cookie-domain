class ExCurrentUserProvider < Auth::DefaultCurrentUserProvider
  TOKEN_COOKIE ||= "_t".freeze

  def log_on_user(user, session, cookies)
    super

    cookies.permanent[TOKEN_COOKIE] = { value: user.auth_token, httponly: true, domain: :all }
  end

  def log_off_user(session, cookies)
    super
    cookies[TOKEN_COOKIE] = {value: "", domain: :all}
  end

end
