
### Film table ###

| FilmId (PK) | Title | DirectorId (FK) | StarId (FK) | WriterId (FK) | Year | Genre | Score |
|-------------|-------|-----------------|-------------|---------------|------|-------|-------|
| INT         | TEXT  | INT             | INT         | INT           | INT  | TEXT  | INT   |

### Director table ###

| DirectorId (PK) | Name | Contry |
|-----------------|------|--------|
| INT             | TEXT | TEXT   |

### Star table ###

| StarId (PK) | Name | DateOfBirth |
|-------------|------|-------------|
| INT         | TEXT | TEXT        |

### Writer table ###

| WriterId (PK) | Name | Email |
|---------------|------|-------|
| INT           | TEXT | TEXT  |

