/*
** my_getnbr.c for my_getnbr in /home/pereni_j/rendu/CPE_2014_Pushswap
** 
** Made by Pereniguez Joseph
** Login   <pereni_j@epitech.net>
** 
** Started on  Fri Dec 12 17:11:58 2014 Pereniguez Joseph
** Last update Fri Dec 12 17:22:25 2014 Pereniguez Joseph
*/

int	my_getnbr(char *str)
{
  int	i;

  i = 0;
  while (*str)
    {
      if (*str >= '0' && *str <= '9')
	{
	  i = i * 10;
	  i = i + *str - '0';
	}
      else
	return (i);
      str = str + 1;
    }
  return (i);
}
