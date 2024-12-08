/* criando um usuário sem privilégio, sem nada, apenas 
limitando o tipo de host (servidor) dele
*/
CREATE USER 
	Rildian@localhost 
IDENTIFIED BY 
	'The Greatest';

/* o usuário alysson só poderia acessar da máquina dele
*/
CREATE USER 
	alyssonbreno@192.168.1.100 
IDENTIFIED BY '69';

/* O usuário só poderia acessar a partir desse domínio
*/
CREATE USER 
	ezequiasferreira@fitbank.com
IDENTIFIED BY '420';

SELECT * FROM mysql.user; 


