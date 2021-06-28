# Jacob - Tech Test

You will have to `bundle install && yarn install` before running `rails c`

The main files here that were added are:

- `app/use_cases/check_fly_buys_card_number.rb`
- `app/models/fly_buys_card.rb`
- `specs/use_cases/check_fly_buys_card_number_spec.rb`
- `specs/models/fly_buys_card_spec.rb`

When running `rails c`, you are able to call `CheckFlyBuysCardNumber.perform("cardnumberhere")` which will `puts` the expected string. If you store the UseCase as a var, you can also access the message with `var_name.message`

Specs can be run by calling `rspec` in the root dir. Specs cover off many cases, but the rest can be tested from the CLI