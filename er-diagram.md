````mermaid
erDiagram
    Director {
        int ID PK
        string name
        strnig country
    }
    Star {
        int ID PK
        string name
        date DOB
    }
    Writer {
        int ID PK
        string name
        string email
    }
    Film {
        int ID PK
        string title
        int year
        string genre
        int score
    }
    
    Star ||--o{ Film : stars_in
    Director ||--o{ Film : directs
    Writer ||--o{ Film : writes
````