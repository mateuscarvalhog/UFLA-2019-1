type Nome = String 
type Curso = String 
type Periodo = Int 
type Nota = Float 
type Aluno = (Nome, Curso, Periodo, Nota) 
type Disciplina = [Aluno] 

alunos :: Int -> Aluno 
alunos matricula
  | matricula == 1 = ("Rodrigo", "S.Inf.", 3, 6.0) 
  | matricula == 2 = ("Joao", "Eng.Comp.", 5, 5.0) 
  | matricula == 3 = ("Lucas", "C.Comp.", 8, 3.5) 
  | matricula == 4 = ("Ana", "C.Comp.", 5, 8.0) 
  | matricula == 5 = ("Maria", "C.Comp.", 7, 9.5) 
  | matricula == 6 = ("Paulo", "C.Comp", 6, 6.0) 
  | matricula == 7 = ("Jose", "S.Inf.", 8, 7.0) 
  | matricula == 8 = ("Eduarda", "C.Comp.", 4, 1.0) 
  | matricula == 9 = ("Carla", "Eng.Comp.", 6, 6.5) 
  | matricula == 10 = ("Luiz", "C.Comp.", 7, 5.7)

contarReprovados :: Int -> Int
contarReprovados n = sum [1 | x <- [1 .. n], espiaNota (alunos x) < 6]

espiaNota :: Aluno -> Float
espiaNota (_, _, _, a) = a

alunoMN :: Int -> String
alunoMN n = head [espiaNome (alunos x) | x <- [1 .. n], espiaNota (alunos x) == menorNota n]

menorNota :: Int -> Float
menorNota n = minimum [nota | x <- [1 .. n], nota <- [espiaNota(alunos x)]]

espiaNome :: Aluno -> String
espiaNome (a, _, _, _) = a
