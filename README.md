# Elixir DSA Learning Repository

A comprehensive learning repository for the Elixir programming language, covering basics, intermediate and advanced concepts, along with data structures and algorithms implementations.

## 🎯 Learning Path

This repository is organized into progressive learning modules:

### 1. **Basics** (`lib/basics/`)
- **Pattern Matching** - Learn Elixir's powerful pattern matching features
- **Processes** - Understanding the Actor model and lightweight processes

### 2. **Intermediate** (`lib/intermediate/`)
- **GenServer** - OTP behaviors and stateful processes
- **Supervision Trees** - Building fault-tolerant systems

### 3. **Advanced** (`lib/advanced/`)
- **Metaprogramming** - Writing code that writes code
- **Distributed Systems** - Multi-node applications

### 4. **Data Structures** (`lib/data_structures/`)
- **Linked Lists** - Dynamic linear data structures
- **Binary Trees** - Hierarchical data organization
- **Graphs** - Network-like data structures

### 5. **Algorithms** (`lib/algorithms/`)
- **Sorting** - Bubble, Quick, Merge, and Insertion sort
- **Searching** - Linear search, Binary search, DFS, BFS
- **Dynamic Programming** - Optimization techniques

## 🚀 Getting Started

### Prerequisites
- Elixir 1.14+ 
- Erlang/OTP 25+

### Installation
```bash
# Clone the repository
git clone https://github.com/paulAlexSerban/wbk--dsa--elixir.git
cd wbk--dsa--elixir

# Install dependencies
mix deps.get

# Compile the project
mix compile
```

### Running Examples
```bash
# Start an interactive Elixir session
iex -S mix

# Try the welcome function
ElixirDsa.welcome()

# Explore pattern matching
ElixirDsa.Basics.PatternMatching.match_tuple({:ok, "success"})

# Test sorting algorithms
ElixirDsa.Algorithms.Sorting.quick_sort([64, 34, 25, 12, 22, 11, 90])

# Work with data structures
list = ElixirDsa.DataStructures.LinkedList.new()
|> ElixirDsa.DataStructures.LinkedList.prepend(1)
|> ElixirDsa.DataStructures.LinkedList.prepend(2)
```

## 🧪 Testing

Run all tests:
```bash
mix test
```

Run specific test files:
```bash
mix test test/basics/pattern_matching_test.exs
mix test test/algorithms/sorting_test.exs
mix test test/data_structures/linked_list_test.exs
```

Run tests with documentation examples:
```bash
mix test --include doctests
```

## 📚 Documentation

Generate documentation:
```bash
mix docs
```

View documentation at `doc/index.html`

## 🎓 Learning Exercises

Each module includes:
- **Comprehensive examples** with real-world use cases
- **Interactive doctests** that you can run and modify
- **Progressive complexity** from basic to advanced concepts
- **Performance considerations** and best practices

### Suggested Learning Order:
1. Start with `ElixirDsa.Basics.PatternMatching`
2. Explore `ElixirDsa.Basics.Processes`
3. Move to `ElixirDsa.Intermediate.SimpleGenServer`
4. Experiment with `ElixirDsa.DataStructures.*` modules
5. Practice with `ElixirDsa.Algorithms.*` implementations
6. Advanced: `ElixirDsa.Advanced.SimpleMetaprogramming`

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📖 Resources

- [Elixir Official Documentation](https://elixir-lang.org/docs.html)
- [Elixir School](https://elixirschool.com/)
- [Learn You Some Erlang](https://learnyousomeerlang.com/)
- [Programming Elixir](https://pragprog.com/titles/elixir16/programming-elixir-1-6/)

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🔗 Related Repositories

Part of the **wbk** (Workbook) series:
- [wbk--dsa--javascript](https://github.com/paulAlexSerban/wbk--dsa--javascript)
- [wbk--dsa--python](https://github.com/paulAlexSerban/wbk--dsa--python)
- [wbk--dsa--rust](https://github.com/paulAlexSerban/wbk--dsa--rust)