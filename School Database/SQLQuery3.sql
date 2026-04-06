    SELECT C.TeacherID, G.SubjectID, AVG(G.Score) AS AverageScore
    FROM Class C
    JOIN Grade G ON C.ClassID = G.ClassID
    GROUP BY C.TeacherID, G.SubjectID,
RankedTeachers AS (
    SELECT TeacherID, SubjectID, AverageScore,
           RANK() OVER (ORDER BY AverageScore DESC) AS Rank
    FROM TeacherAverage
)
SELECT RT.TeacherID, T.FullName, RT.SubjectID, S.Name AS SubjectName, RT.AverageScore
FROM RankedTeachers RT
JOIN Teacher T ON RT.TeacherID = T.TeacherID
JOIN Subject S ON RT.SubjectID = S.SubjectID
WHERE RT.Rank <= 3;
