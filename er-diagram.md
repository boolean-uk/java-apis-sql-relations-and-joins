````mermaid
erDiagram
    Director {
        int ID PK
        strnig country
    }
    Star {
        int ID PK
        date DOB
    }
    Writer {
        int ID PK
        string email
    }
    Film {
        int ID PK
        string title
        int year
        string genre
        int score
    }
    Person {
        int ID PK
        string name
    }
    Cast {
        int actorID FK
        int filmID FK
    }
    Actor {
        int ID PK
        int personID FK
    }
    
    Star ||--o{ Film : stars_in
    Star ||--|| Person : is
    Director ||--o{ Film : directs
    Director ||--|| Person : is
    Writer ||--|| Person : is
    Writer ||--o{ Film : writes
    Cast ||--o{ Actor : has
    Cast ||--|| Film : in
````