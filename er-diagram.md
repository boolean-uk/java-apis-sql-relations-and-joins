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
    
    Star ||--o{ Film : stars_in
    Director ||--o{ Film : directs
    Writer ||--o{ Film : writes
    Star ||--|| Person : is
    Director ||--|| Person : is
    Writer ||--|| Person : is
````