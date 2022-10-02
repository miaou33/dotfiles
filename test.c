#include "stdio.h"
#include "stdlib.h"

int	(*fake_malloc)(const char *str, ...);

int	main()
{
	long long	addr = (long long)printf;

	printf("%llu - %llu = %lld\n", (long long)malloc, (long long)printf, (long long)malloc - (long long)printf);
//	malloc+=230480;
	fake_malloc = (void *)addr;
	fake_malloc("coucou\n");
	return (0);
}
