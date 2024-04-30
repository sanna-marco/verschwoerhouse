//
//  Container+Topics.swift
//  topics
//
//  Created by Marco Sanna on 30.04.24.
//

import Factory
import Domain
import Data

extension Container {
    var topicsRepository: Factory<TopicsRepository> {
        Factory(self) { TopicsRepositoryImpl() }
    }
}