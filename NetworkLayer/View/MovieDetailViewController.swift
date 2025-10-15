//
//  MovieDetailViewController.swift
//  NetworkLayer
//
//  Created by Karla E. Martins Fernandes on 13/09/25.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    private let movie: Movie
    private let genres: String
    
    private let posterImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 8
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 22)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    init(movie: Movie, genres: String) {
        self.movie = movie
        self.genres = genres
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) não foi implementado")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        configure()
    }
    
    private func setupLayout() {
        view.addSubview(posterImageView)
        view.addSubview(titleLabel)
        view.addSubview(infoLabel)
        view.addSubview(overviewLabel)
        
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            posterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            posterImageView.widthAnchor.constraint(equalToConstant: 200),
            posterImageView.heightAnchor.constraint(equalToConstant: 300),
            
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            overviewLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 16),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            ])
    }
    
    private func configure() {
        titleLabel.text = movie.title
        let year = movie.releaseDate?.prefix(4) ?? "N/A"
        infoLabel.text = "\(genres)\nLançamento: \(year)"
        
        
        if let overview = movie.overview {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .justified
            
            let attributedString = NSAttributedString(
                string: overview,
                attributes: [.paragraphStyle: paragraphStyle]
            )
            overviewLabel.attributedText = attributedString
        } else {
            overviewLabel.text = "Sem sinopse disponível."
        }
        
        
        if let path = movie.posterPath {
            let urlString = "https://image.tmdb.org/t/p/w500\(path)"
            if let url = URL(string: urlString) {
                URLSession.shared.dataTask(with: url) { data, _, _ in
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        self.posterImageView.image = UIImage(data: data)
                    }
                }.resume()
            }
        } else {
            posterImageView.image = UIImage(systemName: "photo")
        }
    }
}

