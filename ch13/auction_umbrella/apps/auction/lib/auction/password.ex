defmodule Auction.Password do
  import Pbkdf2

  def hash(password), do:
    hash_pwd_salt(password)

  def hash(password), do:
    hash_pwd_salt(password)

  def verify_with_hash(password, hash), do:
    verify_pass(password, hash)

  def dummy_verify, do: no_user_verify()
end
