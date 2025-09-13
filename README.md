# Elixir Programming (Data Structures and Algorithms Workbook)

## Install Elixir
RUN:
```bash
curl -o ./scripts/install.sh -fsSO https://elixir-lang.org/install.sh
```

RUN:
```bash
bash ./scripts/install.sh elixir@1.18.4 otp@27.3.4
installs_dir=$HOME/.elixir-install/installs
export PATH=$installs_dir/otp/27.3.4/bin:$PATH
export PATH=$installs_dir/elixir/1.18.4-otp-27/bin:$PATH
iex
```

## Generate new Elixir project