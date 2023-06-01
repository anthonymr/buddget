<a name="readme-top"></a>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Usage](#usage)
- [👥 Author](#author)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)

- [📝 License](#license)

# 📖 BuddGet <a name="about-project"></a>

Awesome app to handle your budget and save some money.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

- <a href="https://www.ruby-lang.org/">Ruby</a>
- <a href="https://rubyonrails.org/">Rails</a>
- <a href="https://www.postgresql.org/">PostgreSQL</a>

### Key Features <a name="key-features"></a>

- Create your own user account.
- Add your categories.
- Add your transactions and associate them with as many categories as you want.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Live Demo <a name="live-demo"></a>

- [Live Demo Link](https://buddget-yqtb.onrender.com/welcome)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

### Prerequisites

To run this project you need the following dependencies:

 - Ruby: `3.2.2`
 - Rails: `7.0.5`
 - PostgreSQL: `15.2`

### Setup

- Clone this repository to your local machine:
```sh
  git clone git@github.com:anthonymr/buddget.git
  cd buddget
```
- Install dependencies:
```sh
  bundle install
```
- Create environment variables `POSTGRESQL_USER` and `POSTGRESQL_PASSWORD` or edit `config/database.yml` with your database connection info.

- Recreate Data Base:
```sh
  rake db:schema:load
```

### Usage

To run the project, execute the following command in the terminal:

```  sh
  cd buddget
  rails s  
```

## 👥 Author <a name="author"></a>

👤 **Anthony Martin**

- GitHub: [anthonymr](https://github.com/anthonymr)
- Twitter: [@Anthony2Martin](https://twitter.com/Anthony2Martin)
- LinkedIn: [anthony-martin](https://www.linkedin.com/in/anthony-martin-8820a3117/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🔭 Future Features <a name="future-features"></a>

- Add picture to user account.
- Generate reports.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/anthonymr/anthony-blog/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## ⭐️ Show your support <a name="support"></a>

Give a ⭐️ if you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank the Microverse community for their support and guidance.

Special thanks for [Gregoire Vella](https://www.behance.net/gregoirevella) by providing the orignal design idea.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
