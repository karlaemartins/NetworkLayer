# Movie App – Network Layer

Aplicativo iOS desenvolvido em **Swift e UIKit**, com foco no estudo e implementação de uma **Network Layer reutilizável**, consumindo dados da API do **The Movie Database (TMDB)**.

O aplicativo exibe uma lista de **filmes populares**, permitindo visualizar **poster, gêneros, ano de lançamento e sinopse**.

---

## Funcionalidades

* Listagem de filmes populares
* Exibição do poster do filme
* Visualização de gêneros e ano de lançamento
* Tela de detalhes com sinopse
* Navegação entre telas usando `UINavigationController`

---

## Objetivo do projeto

Este projeto foi desenvolvido para praticar conceitos fundamentais do desenvolvimento iOS:

* Construção de uma **Network Layer reutilizável**
* Consumo de **API REST**
* Decodificação de JSON usando **Codable**
* Separação de responsabilidades com **MVVM**
* Interface construída **programaticamente com UIKit**
* Uso de **UITableView**

---

## Arquitetura

O projeto utiliza uma estrutura inspirada em **MVVM**.

Fluxo de comunicação:

View
↓
ViewModel
↓
Network Layer
↓
API

### Camadas do projeto

**View**

Responsável pela interface e interação com o usuário.

* MovieListViewController
* MovieDetailViewController
* MovieTableViewCell

**ViewModel**

Responsável pela lógica de apresentação e comunicação com a camada de rede.

* MovieListViewModel

**Model**

Representação dos dados retornados pela API.

* Movie
* Genre
* MovieResponse
* GenreResponse

**Network Layer**

Responsável pela construção e execução das requisições HTTP.

* EndPoint
* HTTPMethod
* NetworkRequest
* Services

---

## Network Layer

A Network Layer foi construída para ser **genérica e reutilizável**, utilizando protocolos para definir endpoints.

---

## 🗂 Estrutura do projeto

```
NetworkLayer

    NetworkLayer
        EndPoint.swift
        HTTPMethod.swift
        NetworkRequest.swift
        Services.swift

        Model
            Movie.swift

        View
            MovieListViewController.swift
            MovieDetailViewController.swift
            MovieTableViewCell.swift

        ViewModel
            MovieListViewModel.swift
```

---

## Tecnologias utilizadas

* Swift
* UIKit
* URLSession
* Codable
* MVVM
* AutoLayout
* UITableView

---

## API utilizada

Este projeto utiliza a API pública do **The Movie Database (TMDB)**.

https://developer.themoviedb.org

---
