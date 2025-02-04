UPDATE Salary
    SET sex = 
    CASE
        WHEN sex = 'm' THEN 'f'
        WHEN sex = 'f' THEN 'm'
    END 

-- veja que é uma tualização simultanea, eles n ocorrem por exemplo dps da atualização
-- de uma, é instantaneo na tabela inteira, por isso da certo
    
