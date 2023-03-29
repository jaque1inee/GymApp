//
//  Exercise.swift
//  GymApp
//
//  Created by Jaqueline Oliveira on 26/12/22.
//

import Foundation
import UIKit

struct ExerciseResult: Decodable {
    var next: String?
    var results: [Exercise] = []
}

struct Exercise: Decodable {
    var id: Int?
    var name: String?
    var description: String?
    var category: CategoryExercise?
    var equipment: [Equipment]?
    var images: [ImageExercise]?
    var muscles: [Muscles]?
}

struct CategoryExercise: Decodable {
    var id: Int?
    var name: String?
}

struct Equipment: Decodable {
    var id: Int?
    var name: String?
}

struct ImageExercise: Decodable {
    var image: String?
}

struct Muscles: Decodable {
    var name: String?
    var image_url_main: String?
}






//{
//    "count": 414,
//    "next": "https://wger.de/api/v2/exerciseinfo/?limit=20&offset=20",
//    "previous": null,
//    "results": [
//        {
//            "id": 345,
//            "name": "2 Handed Kettlebell Swing",
//            "aliases": [],
//            "uuid": "c788d643-150a-4ac7-97ef-84643c6419bf",
//            "exercise_base_id": 9,
//            "description": "<p>Two Handed Russian Style Kettlebell swing</p>",
//            "creation_date": "2015-08-03",
//            "category": {
//                "id": 10,
//                "name": "Abs"
//            },
//            "muscles": [],
//            "muscles_secondary": [],
//            "equipment": [
//                {
//                    "id": 10,
//                    "name": "Kettlebell"
//                }
//            ],
//            "language": {
//                "id": 2,
//                "short_name": "en",
//                "full_name": "English"
//            },
//            "license": {
//                "id": 2,
//                "full_name": "Creative Commons Attribution Share Alike 4",
//                "short_name": "CC-BY-SA 4",
//                "url": "https://creativecommons.org/licenses/by-sa/4.0/deed.en"
//            },
//            "license_author": "deusinvictus",
//            "images": [],
//            "videos": [],
//            "comments": [],
//            "variations": [
//                345,
//                249
//            ],
//            "author_history": [
//                "deusinvictus"
//            ]
//        },
//        {
//            "id": 1061,
//            "name": "Abdominal Stabilization",
//            "aliases": [],
//            "uuid": "60d8018d-296f-4c62-a80b-f609a25d34ea",
//            "exercise_base_id": 56,
//            "description": "",
//            "creation_date": "2022-10-11",
//            "category": {
//                "id": 10,
//                "name": "Abs"
//            },
//            "muscles": [
//                {
//                    "id": 6,
//                    "name": "Rectus abdominis",
//                    "name_en": "Abs",
//                    "is_front": true,
//                    "image_url_main": "/static/images/muscles/main/muscle-6.svg",
//                    "image_url_secondary": "/static/images/muscles/secondary/muscle-6.svg"
//                }
//            ],
//            "muscles_secondary": [
//                {
//                    "id": 14,
//                    "name": "Obliquus externus abdominis",
//                    "name_en": "",
//                    "is_front": true,
//                    "image_url_main": "/static/images/muscles/main/muscle-14.svg",
//                    "image_url_secondary": "/static/images/muscles/secondary/muscle-14.svg"
//                }
//            ],
//            "equipment": [
//                {
//                    "id": 4,
//                    "name": "Gym mat"
//                }
//            ],
//            "language": {
//                "id": 2,
//                "short_name": "en",
//                "full_name": "English"
//            },
//            "license": {
//                "id": 2,
//                "full_name": "Creative Commons Attribution Share Alike 4",
//                "short_name": "CC-BY-SA 4",
//                "url": "https://creativecommons.org/licenses/by-sa/4.0/deed.en"
//            },
//            "license_author": "wger.de",
//            "images": [],
//            "videos": [],
//            "comments": [],
//            "variations": [],
//            "author_history": [
//                "wger.de"
//            ]
//        },
//        {
//            "id": 174,
//            "name": "Abduktoren-Maschine",
//            "aliases": [],
//            "uuid": "99881bdd-43d7-4c3b-82ed-9c187d0455b7",
//            "exercise_base_id": 12,
//            "description": "<ul>\n<li>in eine aufrechte Position setzen, bei der die Beine hüftbreit geöffnet sind</li>\n<li>den Rücken, die Knie und die Oberschenkelaußenseite an die jeweiligen Polster pressen</li>\n<li>mit den Händen an den Griffen festhalten</li>\n<li>die Oberschenkel bis zum Anschlagpunkt der Hebelarme auseinander drücken</li>\n<li>danach die Beine wieder zusammen führen</li>\n<li>das Gesäß nicht vom Sitz abheben</li>\n<li>beim Auseinanderdrücken der Hebelarme aus- und beim Zusammenführen einatmen</li>\n</ul>",
//            "creation_date": "2013-07-19",
//            "category": {
//                "id": 9,
//                "name": "Legs"
//            },
//            "muscles": [
//                {
//                    "id": 8,
//                    "name": "Gluteus maximus",
//                    "name_en": "Glutes",
//                    "is_front": false,
//                    "image_url_main": "/static/images/muscles/main/muscle-8.svg",
//                    "image_url_secondary": "/static/images/muscles/secondary/muscle-8.svg"
//                }
//            ],
//            "muscles_secondary": [],
//            "equipment": [],
//            "language": {
//                "id": 1,
//                "short_name": "de",
//                "full_name": "Deutsch"
//            },
//            "license": {
//                "id": 1,
//                "full_name": " Creative Commons Attribution Share Alike 3",
//                "short_name": "CC-BY-SA 3",
//                "url": "https://creativecommons.org/licenses/by-sa/3.0/deed.en"
//            },
//            "license_author": "flori",
//            "images": [],
//            "videos": [
//                {
//                    "id": 74,
//                    "uuid": "5148c579-5df2-4618-9a7b-a2e29ac4dd7d",
//                    "exercise_base": 12,
//                    "exercise_base_uuid": "53906cd1-61f1-4d56-ac60-e4fcc5824861",
//                    "video": "https://wger.de/media/exercise-video/12/5148c579-5df2-4618-9a7b-a2e29ac4dd7d.MOV",
//                    "is_main": false,
//                    "size": 0,
//                    "duration": "0.00",
//                    "width": 0,
//                    "height": 0,
//                    "codec": "",
//                    "codec_long": "",
//                    "license": 2,
//                    "license_author": "Goulart",
//                    "author_history": [
//                        "Goulart"
//                    ]
//                }
//            ],
//            "comments": [],
//            "variations": [],
//            "author_history": [
//                "flori"
//            ]
//        },
//        {
//            "id": 228,
//            "name": "Arnold Press",
//            "aliases": [],
//            "uuid": "880bff63-6798-4ffc-a818-b2a1ccfec0f7",
//            "exercise_base_id": 20,
//            "description": "<p>Zwei Kurzhanteln mit den Handflächen nach innen vor der Brust halten, Ellbogen unterhalb der Handgelenke.</p>\n<p>Ellbogen nach außen bringen und Hanteln über den Kopf heben. Drehung kommt aus dem Ellbogen, nicht aus den Armen!</p>\n<p>Wenn die Arme durchgestreckt sind, die gleiche Bewegung rückwärts ausführen.</p>",
//            "creation_date": "2014-03-09",
//            "category": {
//                "id": 13,
//                "name": "Shoulders"
//            },
//            "muscles": [],
//            "muscles_secondary": [],
//            "equipment": [
//                {
//                    "id": 3,
//                    "name": "Dumbbell"
//                }
//            ],
//            "language": {
//                "id": 1,
//                "short_name": "de",
//                "full_name": "Deutsch"
//            },
//            "license": {
//                "id": 3,
//                "full_name": "Creative Commons Public Domain 1.0",
//                "short_name": "CC0",
//                "url": "http://creativecommons.org/publicdomain/zero/1.0/"
//            },
//            "license_author": "bloody_disgrace",
//            "images": [],
//            "videos": [],
//            "comments": [],
//            "variations": [
//                228,
//                53,
//                66,
//                241,
//                266
//            ],
//            "author_history": [
//                "bloody_disgrace"
//            ]
//        },
