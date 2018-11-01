# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Apicloset.Repo.insert!(%Apicloset.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Apicloset.Accounts
alias Apicloset.Posts

Accounts.create_user(%{name: "pietro", email: "pietro@test.com"})
Accounts.create_user(%{name: "nicole", email: "nicole@test.com"})

for _ <- 1..10 do
  Posts.create_post(%{
    title: Faker.Lorem.sentence,
    body: Faker.Lorem.paragraph,
    user_id: [1, 2] |> Enum.take_random(1) |> hd
  })
end
