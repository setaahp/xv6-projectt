
user/_trigger_test:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "../kernel/types.h"
#include "user.h" 
#include "../kernel/custom_logger.h"


int main() {
   0:	1141                	addi	sp,sp,-16
   2:	e406                	sd	ra,8(sp)
   4:	e022                	sd	s0,0(sp)
   6:	0800                	addi	s0,sp,16
    
    trigger();
   8:	318000ef          	jal	320 <trigger>
   c:	4501                	li	a0,0
   e:	60a2                	ld	ra,8(sp)
  10:	6402                	ld	s0,0(sp)
  12:	0141                	addi	sp,sp,16
  14:	8082                	ret

0000000000000016 <start>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
start()
{
  16:	1141                	addi	sp,sp,-16
  18:	e406                	sd	ra,8(sp)
  1a:	e022                	sd	s0,0(sp)
  1c:	0800                	addi	s0,sp,16
  extern int main();
  main();
  1e:	fe3ff0ef          	jal	0 <main>
  exit(0);
  22:	4501                	li	a0,0
  24:	25c000ef          	jal	280 <exit>

0000000000000028 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
  28:	1141                	addi	sp,sp,-16
  2a:	e422                	sd	s0,8(sp)
  2c:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  2e:	87aa                	mv	a5,a0
  30:	0585                	addi	a1,a1,1
  32:	0785                	addi	a5,a5,1
  34:	fff5c703          	lbu	a4,-1(a1)
  38:	fee78fa3          	sb	a4,-1(a5)
  3c:	fb75                	bnez	a4,30 <strcpy+0x8>
    ;
  return os;
}
  3e:	6422                	ld	s0,8(sp)
  40:	0141                	addi	sp,sp,16
  42:	8082                	ret

0000000000000044 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  44:	1141                	addi	sp,sp,-16
  46:	e422                	sd	s0,8(sp)
  48:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  4a:	00054783          	lbu	a5,0(a0)
  4e:	cb91                	beqz	a5,62 <strcmp+0x1e>
  50:	0005c703          	lbu	a4,0(a1)
  54:	00f71763          	bne	a4,a5,62 <strcmp+0x1e>
    p++, q++;
  58:	0505                	addi	a0,a0,1
  5a:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  5c:	00054783          	lbu	a5,0(a0)
  60:	fbe5                	bnez	a5,50 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
  62:	0005c503          	lbu	a0,0(a1)
}
  66:	40a7853b          	subw	a0,a5,a0
  6a:	6422                	ld	s0,8(sp)
  6c:	0141                	addi	sp,sp,16
  6e:	8082                	ret

0000000000000070 <strlen>:

uint
strlen(const char *s)
{
  70:	1141                	addi	sp,sp,-16
  72:	e422                	sd	s0,8(sp)
  74:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
  76:	00054783          	lbu	a5,0(a0)
  7a:	cf91                	beqz	a5,96 <strlen+0x26>
  7c:	0505                	addi	a0,a0,1
  7e:	87aa                	mv	a5,a0
  80:	86be                	mv	a3,a5
  82:	0785                	addi	a5,a5,1
  84:	fff7c703          	lbu	a4,-1(a5)
  88:	ff65                	bnez	a4,80 <strlen+0x10>
  8a:	40a6853b          	subw	a0,a3,a0
  8e:	2505                	addiw	a0,a0,1
    ;
  return n;
}
  90:	6422                	ld	s0,8(sp)
  92:	0141                	addi	sp,sp,16
  94:	8082                	ret
  for(n = 0; s[n]; n++)
  96:	4501                	li	a0,0
  98:	bfe5                	j	90 <strlen+0x20>

000000000000009a <memset>:

void*
memset(void *dst, int c, uint n)
{
  9a:	1141                	addi	sp,sp,-16
  9c:	e422                	sd	s0,8(sp)
  9e:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
  a0:	ca19                	beqz	a2,b6 <memset+0x1c>
  a2:	87aa                	mv	a5,a0
  a4:	1602                	slli	a2,a2,0x20
  a6:	9201                	srli	a2,a2,0x20
  a8:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
  ac:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
  b0:	0785                	addi	a5,a5,1
  b2:	fee79de3          	bne	a5,a4,ac <memset+0x12>
  }
  return dst;
}
  b6:	6422                	ld	s0,8(sp)
  b8:	0141                	addi	sp,sp,16
  ba:	8082                	ret

00000000000000bc <strchr>:

char*
strchr(const char *s, char c)
{
  bc:	1141                	addi	sp,sp,-16
  be:	e422                	sd	s0,8(sp)
  c0:	0800                	addi	s0,sp,16
  for(; *s; s++)
  c2:	00054783          	lbu	a5,0(a0)
  c6:	cb99                	beqz	a5,dc <strchr+0x20>
    if(*s == c)
  c8:	00f58763          	beq	a1,a5,d6 <strchr+0x1a>
  for(; *s; s++)
  cc:	0505                	addi	a0,a0,1
  ce:	00054783          	lbu	a5,0(a0)
  d2:	fbfd                	bnez	a5,c8 <strchr+0xc>
      return (char*)s;
  return 0;
  d4:	4501                	li	a0,0
}
  d6:	6422                	ld	s0,8(sp)
  d8:	0141                	addi	sp,sp,16
  da:	8082                	ret
  return 0;
  dc:	4501                	li	a0,0
  de:	bfe5                	j	d6 <strchr+0x1a>

00000000000000e0 <gets>:

char*
gets(char *buf, int max)
{
  e0:	711d                	addi	sp,sp,-96
  e2:	ec86                	sd	ra,88(sp)
  e4:	e8a2                	sd	s0,80(sp)
  e6:	e4a6                	sd	s1,72(sp)
  e8:	e0ca                	sd	s2,64(sp)
  ea:	fc4e                	sd	s3,56(sp)
  ec:	f852                	sd	s4,48(sp)
  ee:	f456                	sd	s5,40(sp)
  f0:	f05a                	sd	s6,32(sp)
  f2:	ec5e                	sd	s7,24(sp)
  f4:	1080                	addi	s0,sp,96
  f6:	8baa                	mv	s7,a0
  f8:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
  fa:	892a                	mv	s2,a0
  fc:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
  fe:	4aa9                	li	s5,10
 100:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 102:	89a6                	mv	s3,s1
 104:	2485                	addiw	s1,s1,1
 106:	0344d663          	bge	s1,s4,132 <gets+0x52>
    cc = read(0, &c, 1);
 10a:	4605                	li	a2,1
 10c:	faf40593          	addi	a1,s0,-81
 110:	4501                	li	a0,0
 112:	186000ef          	jal	298 <read>
    if(cc < 1)
 116:	00a05e63          	blez	a0,132 <gets+0x52>
    buf[i++] = c;
 11a:	faf44783          	lbu	a5,-81(s0)
 11e:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 122:	01578763          	beq	a5,s5,130 <gets+0x50>
 126:	0905                	addi	s2,s2,1
 128:	fd679de3          	bne	a5,s6,102 <gets+0x22>
    buf[i++] = c;
 12c:	89a6                	mv	s3,s1
 12e:	a011                	j	132 <gets+0x52>
 130:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 132:	99de                	add	s3,s3,s7
 134:	00098023          	sb	zero,0(s3)
  return buf;
}
 138:	855e                	mv	a0,s7
 13a:	60e6                	ld	ra,88(sp)
 13c:	6446                	ld	s0,80(sp)
 13e:	64a6                	ld	s1,72(sp)
 140:	6906                	ld	s2,64(sp)
 142:	79e2                	ld	s3,56(sp)
 144:	7a42                	ld	s4,48(sp)
 146:	7aa2                	ld	s5,40(sp)
 148:	7b02                	ld	s6,32(sp)
 14a:	6be2                	ld	s7,24(sp)
 14c:	6125                	addi	sp,sp,96
 14e:	8082                	ret

0000000000000150 <stat>:

int
stat(const char *n, struct stat *st)
{
 150:	1101                	addi	sp,sp,-32
 152:	ec06                	sd	ra,24(sp)
 154:	e822                	sd	s0,16(sp)
 156:	e04a                	sd	s2,0(sp)
 158:	1000                	addi	s0,sp,32
 15a:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 15c:	4581                	li	a1,0
 15e:	162000ef          	jal	2c0 <open>
  if(fd < 0)
 162:	02054263          	bltz	a0,186 <stat+0x36>
 166:	e426                	sd	s1,8(sp)
 168:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 16a:	85ca                	mv	a1,s2
 16c:	16c000ef          	jal	2d8 <fstat>
 170:	892a                	mv	s2,a0
  close(fd);
 172:	8526                	mv	a0,s1
 174:	134000ef          	jal	2a8 <close>
  return r;
 178:	64a2                	ld	s1,8(sp)
}
 17a:	854a                	mv	a0,s2
 17c:	60e2                	ld	ra,24(sp)
 17e:	6442                	ld	s0,16(sp)
 180:	6902                	ld	s2,0(sp)
 182:	6105                	addi	sp,sp,32
 184:	8082                	ret
    return -1;
 186:	597d                	li	s2,-1
 188:	bfcd                	j	17a <stat+0x2a>

000000000000018a <atoi>:

int
atoi(const char *s)
{
 18a:	1141                	addi	sp,sp,-16
 18c:	e422                	sd	s0,8(sp)
 18e:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 190:	00054683          	lbu	a3,0(a0)
 194:	fd06879b          	addiw	a5,a3,-48
 198:	0ff7f793          	zext.b	a5,a5
 19c:	4625                	li	a2,9
 19e:	02f66863          	bltu	a2,a5,1ce <atoi+0x44>
 1a2:	872a                	mv	a4,a0
  n = 0;
 1a4:	4501                	li	a0,0
    n = n*10 + *s++ - '0';
 1a6:	0705                	addi	a4,a4,1
 1a8:	0025179b          	slliw	a5,a0,0x2
 1ac:	9fa9                	addw	a5,a5,a0
 1ae:	0017979b          	slliw	a5,a5,0x1
 1b2:	9fb5                	addw	a5,a5,a3
 1b4:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 1b8:	00074683          	lbu	a3,0(a4)
 1bc:	fd06879b          	addiw	a5,a3,-48
 1c0:	0ff7f793          	zext.b	a5,a5
 1c4:	fef671e3          	bgeu	a2,a5,1a6 <atoi+0x1c>
  return n;
}
 1c8:	6422                	ld	s0,8(sp)
 1ca:	0141                	addi	sp,sp,16
 1cc:	8082                	ret
  n = 0;
 1ce:	4501                	li	a0,0
 1d0:	bfe5                	j	1c8 <atoi+0x3e>

00000000000001d2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1d2:	1141                	addi	sp,sp,-16
 1d4:	e422                	sd	s0,8(sp)
 1d6:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 1d8:	02b57463          	bgeu	a0,a1,200 <memmove+0x2e>
    while(n-- > 0)
 1dc:	00c05f63          	blez	a2,1fa <memmove+0x28>
 1e0:	1602                	slli	a2,a2,0x20
 1e2:	9201                	srli	a2,a2,0x20
 1e4:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 1e8:	872a                	mv	a4,a0
      *dst++ = *src++;
 1ea:	0585                	addi	a1,a1,1
 1ec:	0705                	addi	a4,a4,1
 1ee:	fff5c683          	lbu	a3,-1(a1)
 1f2:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 1f6:	fef71ae3          	bne	a4,a5,1ea <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 1fa:	6422                	ld	s0,8(sp)
 1fc:	0141                	addi	sp,sp,16
 1fe:	8082                	ret
    dst += n;
 200:	00c50733          	add	a4,a0,a2
    src += n;
 204:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 206:	fec05ae3          	blez	a2,1fa <memmove+0x28>
 20a:	fff6079b          	addiw	a5,a2,-1
 20e:	1782                	slli	a5,a5,0x20
 210:	9381                	srli	a5,a5,0x20
 212:	fff7c793          	not	a5,a5
 216:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 218:	15fd                	addi	a1,a1,-1
 21a:	177d                	addi	a4,a4,-1
 21c:	0005c683          	lbu	a3,0(a1)
 220:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 224:	fee79ae3          	bne	a5,a4,218 <memmove+0x46>
 228:	bfc9                	j	1fa <memmove+0x28>

000000000000022a <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 22a:	1141                	addi	sp,sp,-16
 22c:	e422                	sd	s0,8(sp)
 22e:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 230:	ca05                	beqz	a2,260 <memcmp+0x36>
 232:	fff6069b          	addiw	a3,a2,-1
 236:	1682                	slli	a3,a3,0x20
 238:	9281                	srli	a3,a3,0x20
 23a:	0685                	addi	a3,a3,1
 23c:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 23e:	00054783          	lbu	a5,0(a0)
 242:	0005c703          	lbu	a4,0(a1)
 246:	00e79863          	bne	a5,a4,256 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 24a:	0505                	addi	a0,a0,1
    p2++;
 24c:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 24e:	fed518e3          	bne	a0,a3,23e <memcmp+0x14>
  }
  return 0;
 252:	4501                	li	a0,0
 254:	a019                	j	25a <memcmp+0x30>
      return *p1 - *p2;
 256:	40e7853b          	subw	a0,a5,a4
}
 25a:	6422                	ld	s0,8(sp)
 25c:	0141                	addi	sp,sp,16
 25e:	8082                	ret
  return 0;
 260:	4501                	li	a0,0
 262:	bfe5                	j	25a <memcmp+0x30>

0000000000000264 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 264:	1141                	addi	sp,sp,-16
 266:	e406                	sd	ra,8(sp)
 268:	e022                	sd	s0,0(sp)
 26a:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 26c:	f67ff0ef          	jal	1d2 <memmove>
}
 270:	60a2                	ld	ra,8(sp)
 272:	6402                	ld	s0,0(sp)
 274:	0141                	addi	sp,sp,16
 276:	8082                	ret

0000000000000278 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 278:	4885                	li	a7,1
 ecall
 27a:	00000073          	ecall
 ret
 27e:	8082                	ret

0000000000000280 <exit>:
.global exit
exit:
 li a7, SYS_exit
 280:	4889                	li	a7,2
 ecall
 282:	00000073          	ecall
 ret
 286:	8082                	ret

0000000000000288 <wait>:
.global wait
wait:
 li a7, SYS_wait
 288:	488d                	li	a7,3
 ecall
 28a:	00000073          	ecall
 ret
 28e:	8082                	ret

0000000000000290 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 290:	4891                	li	a7,4
 ecall
 292:	00000073          	ecall
 ret
 296:	8082                	ret

0000000000000298 <read>:
.global read
read:
 li a7, SYS_read
 298:	4895                	li	a7,5
 ecall
 29a:	00000073          	ecall
 ret
 29e:	8082                	ret

00000000000002a0 <write>:
.global write
write:
 li a7, SYS_write
 2a0:	48c1                	li	a7,16
 ecall
 2a2:	00000073          	ecall
 ret
 2a6:	8082                	ret

00000000000002a8 <close>:
.global close
close:
 li a7, SYS_close
 2a8:	48d5                	li	a7,21
 ecall
 2aa:	00000073          	ecall
 ret
 2ae:	8082                	ret

00000000000002b0 <kill>:
.global kill
kill:
 li a7, SYS_kill
 2b0:	4899                	li	a7,6
 ecall
 2b2:	00000073          	ecall
 ret
 2b6:	8082                	ret

00000000000002b8 <exec>:
.global exec
exec:
 li a7, SYS_exec
 2b8:	489d                	li	a7,7
 ecall
 2ba:	00000073          	ecall
 ret
 2be:	8082                	ret

00000000000002c0 <open>:
.global open
open:
 li a7, SYS_open
 2c0:	48bd                	li	a7,15
 ecall
 2c2:	00000073          	ecall
 ret
 2c6:	8082                	ret

00000000000002c8 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 2c8:	48c5                	li	a7,17
 ecall
 2ca:	00000073          	ecall
 ret
 2ce:	8082                	ret

00000000000002d0 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 2d0:	48c9                	li	a7,18
 ecall
 2d2:	00000073          	ecall
 ret
 2d6:	8082                	ret

00000000000002d8 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 2d8:	48a1                	li	a7,8
 ecall
 2da:	00000073          	ecall
 ret
 2de:	8082                	ret

00000000000002e0 <link>:
.global link
link:
 li a7, SYS_link
 2e0:	48cd                	li	a7,19
 ecall
 2e2:	00000073          	ecall
 ret
 2e6:	8082                	ret

00000000000002e8 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 2e8:	48d1                	li	a7,20
 ecall
 2ea:	00000073          	ecall
 ret
 2ee:	8082                	ret

00000000000002f0 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 2f0:	48a5                	li	a7,9
 ecall
 2f2:	00000073          	ecall
 ret
 2f6:	8082                	ret

00000000000002f8 <dup>:
.global dup
dup:
 li a7, SYS_dup
 2f8:	48a9                	li	a7,10
 ecall
 2fa:	00000073          	ecall
 ret
 2fe:	8082                	ret

0000000000000300 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 300:	48ad                	li	a7,11
 ecall
 302:	00000073          	ecall
 ret
 306:	8082                	ret

0000000000000308 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 308:	48b1                	li	a7,12
 ecall
 30a:	00000073          	ecall
 ret
 30e:	8082                	ret

0000000000000310 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 310:	48b5                	li	a7,13
 ecall
 312:	00000073          	ecall
 ret
 316:	8082                	ret

0000000000000318 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 318:	48b9                	li	a7,14
 ecall
 31a:	00000073          	ecall
 ret
 31e:	8082                	ret

0000000000000320 <trigger>:
.global trigger
trigger:
 li a7, SYS_trigger
 320:	48d9                	li	a7,22
 ecall
 322:	00000073          	ecall
 ret
 326:	8082                	ret

0000000000000328 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 328:	1101                	addi	sp,sp,-32
 32a:	ec06                	sd	ra,24(sp)
 32c:	e822                	sd	s0,16(sp)
 32e:	1000                	addi	s0,sp,32
 330:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 334:	4605                	li	a2,1
 336:	fef40593          	addi	a1,s0,-17
 33a:	f67ff0ef          	jal	2a0 <write>
}
 33e:	60e2                	ld	ra,24(sp)
 340:	6442                	ld	s0,16(sp)
 342:	6105                	addi	sp,sp,32
 344:	8082                	ret

0000000000000346 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 346:	7139                	addi	sp,sp,-64
 348:	fc06                	sd	ra,56(sp)
 34a:	f822                	sd	s0,48(sp)
 34c:	f426                	sd	s1,40(sp)
 34e:	0080                	addi	s0,sp,64
 350:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 352:	c299                	beqz	a3,358 <printint+0x12>
 354:	0805c963          	bltz	a1,3e6 <printint+0xa0>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 358:	2581                	sext.w	a1,a1
  neg = 0;
 35a:	4881                	li	a7,0
 35c:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 360:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 362:	2601                	sext.w	a2,a2
 364:	00000517          	auipc	a0,0x0
 368:	4f450513          	addi	a0,a0,1268 # 858 <digits>
 36c:	883a                	mv	a6,a4
 36e:	2705                	addiw	a4,a4,1
 370:	02c5f7bb          	remuw	a5,a1,a2
 374:	1782                	slli	a5,a5,0x20
 376:	9381                	srli	a5,a5,0x20
 378:	97aa                	add	a5,a5,a0
 37a:	0007c783          	lbu	a5,0(a5)
 37e:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 382:	0005879b          	sext.w	a5,a1
 386:	02c5d5bb          	divuw	a1,a1,a2
 38a:	0685                	addi	a3,a3,1
 38c:	fec7f0e3          	bgeu	a5,a2,36c <printint+0x26>
  if(neg)
 390:	00088c63          	beqz	a7,3a8 <printint+0x62>
    buf[i++] = '-';
 394:	fd070793          	addi	a5,a4,-48
 398:	00878733          	add	a4,a5,s0
 39c:	02d00793          	li	a5,45
 3a0:	fef70823          	sb	a5,-16(a4)
 3a4:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 3a8:	02e05a63          	blez	a4,3dc <printint+0x96>
 3ac:	f04a                	sd	s2,32(sp)
 3ae:	ec4e                	sd	s3,24(sp)
 3b0:	fc040793          	addi	a5,s0,-64
 3b4:	00e78933          	add	s2,a5,a4
 3b8:	fff78993          	addi	s3,a5,-1
 3bc:	99ba                	add	s3,s3,a4
 3be:	377d                	addiw	a4,a4,-1
 3c0:	1702                	slli	a4,a4,0x20
 3c2:	9301                	srli	a4,a4,0x20
 3c4:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 3c8:	fff94583          	lbu	a1,-1(s2)
 3cc:	8526                	mv	a0,s1
 3ce:	f5bff0ef          	jal	328 <putc>
  while(--i >= 0)
 3d2:	197d                	addi	s2,s2,-1
 3d4:	ff391ae3          	bne	s2,s3,3c8 <printint+0x82>
 3d8:	7902                	ld	s2,32(sp)
 3da:	69e2                	ld	s3,24(sp)
}
 3dc:	70e2                	ld	ra,56(sp)
 3de:	7442                	ld	s0,48(sp)
 3e0:	74a2                	ld	s1,40(sp)
 3e2:	6121                	addi	sp,sp,64
 3e4:	8082                	ret
    x = -xx;
 3e6:	40b005bb          	negw	a1,a1
    neg = 1;
 3ea:	4885                	li	a7,1
    x = -xx;
 3ec:	bf85                	j	35c <printint+0x16>

00000000000003ee <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 3ee:	711d                	addi	sp,sp,-96
 3f0:	ec86                	sd	ra,88(sp)
 3f2:	e8a2                	sd	s0,80(sp)
 3f4:	e0ca                	sd	s2,64(sp)
 3f6:	1080                	addi	s0,sp,96
  char *s;
  int c0, c1, c2, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 3f8:	0005c903          	lbu	s2,0(a1)
 3fc:	26090863          	beqz	s2,66c <vprintf+0x27e>
 400:	e4a6                	sd	s1,72(sp)
 402:	fc4e                	sd	s3,56(sp)
 404:	f852                	sd	s4,48(sp)
 406:	f456                	sd	s5,40(sp)
 408:	f05a                	sd	s6,32(sp)
 40a:	ec5e                	sd	s7,24(sp)
 40c:	e862                	sd	s8,16(sp)
 40e:	e466                	sd	s9,8(sp)
 410:	8b2a                	mv	s6,a0
 412:	8a2e                	mv	s4,a1
 414:	8bb2                	mv	s7,a2
  state = 0;
 416:	4981                	li	s3,0
  for(i = 0; fmt[i]; i++){
 418:	4481                	li	s1,0
 41a:	4701                	li	a4,0
      if(c0 == '%'){
        state = '%';
      } else {
        putc(fd, c0);
      }
    } else if(state == '%'){
 41c:	02500a93          	li	s5,37
      c1 = c2 = 0;
      if(c0) c1 = fmt[i+1] & 0xff;
      if(c1) c2 = fmt[i+2] & 0xff;
      if(c0 == 'd'){
 420:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c0 == 'l' && c1 == 'd'){
 424:	06c00c93          	li	s9,108
 428:	a005                	j	448 <vprintf+0x5a>
        putc(fd, c0);
 42a:	85ca                	mv	a1,s2
 42c:	855a                	mv	a0,s6
 42e:	efbff0ef          	jal	328 <putc>
 432:	a019                	j	438 <vprintf+0x4a>
    } else if(state == '%'){
 434:	03598263          	beq	s3,s5,458 <vprintf+0x6a>
  for(i = 0; fmt[i]; i++){
 438:	2485                	addiw	s1,s1,1
 43a:	8726                	mv	a4,s1
 43c:	009a07b3          	add	a5,s4,s1
 440:	0007c903          	lbu	s2,0(a5)
 444:	20090c63          	beqz	s2,65c <vprintf+0x26e>
    c0 = fmt[i] & 0xff;
 448:	0009079b          	sext.w	a5,s2
    if(state == 0){
 44c:	fe0994e3          	bnez	s3,434 <vprintf+0x46>
      if(c0 == '%'){
 450:	fd579de3          	bne	a5,s5,42a <vprintf+0x3c>
        state = '%';
 454:	89be                	mv	s3,a5
 456:	b7cd                	j	438 <vprintf+0x4a>
      if(c0) c1 = fmt[i+1] & 0xff;
 458:	00ea06b3          	add	a3,s4,a4
 45c:	0016c683          	lbu	a3,1(a3)
      c1 = c2 = 0;
 460:	8636                	mv	a2,a3
      if(c1) c2 = fmt[i+2] & 0xff;
 462:	c681                	beqz	a3,46a <vprintf+0x7c>
 464:	9752                	add	a4,a4,s4
 466:	00274603          	lbu	a2,2(a4)
      if(c0 == 'd'){
 46a:	03878f63          	beq	a5,s8,4a8 <vprintf+0xba>
      } else if(c0 == 'l' && c1 == 'd'){
 46e:	05978963          	beq	a5,s9,4c0 <vprintf+0xd2>
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 2;
      } else if(c0 == 'u'){
 472:	07500713          	li	a4,117
 476:	0ee78363          	beq	a5,a4,55c <vprintf+0x16e>
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 2;
      } else if(c0 == 'x'){
 47a:	07800713          	li	a4,120
 47e:	12e78563          	beq	a5,a4,5a8 <vprintf+0x1ba>
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 2;
      } else if(c0 == 'p'){
 482:	07000713          	li	a4,112
 486:	14e78a63          	beq	a5,a4,5da <vprintf+0x1ec>
        printptr(fd, va_arg(ap, uint64));
      } else if(c0 == 's'){
 48a:	07300713          	li	a4,115
 48e:	18e78a63          	beq	a5,a4,622 <vprintf+0x234>
        if((s = va_arg(ap, char*)) == 0)
          s = "(null)";
        for(; *s; s++)
          putc(fd, *s);
      } else if(c0 == '%'){
 492:	02500713          	li	a4,37
 496:	04e79563          	bne	a5,a4,4e0 <vprintf+0xf2>
        putc(fd, '%');
 49a:	02500593          	li	a1,37
 49e:	855a                	mv	a0,s6
 4a0:	e89ff0ef          	jal	328 <putc>
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
#endif
      state = 0;
 4a4:	4981                	li	s3,0
 4a6:	bf49                	j	438 <vprintf+0x4a>
        printint(fd, va_arg(ap, int), 10, 1);
 4a8:	008b8913          	addi	s2,s7,8
 4ac:	4685                	li	a3,1
 4ae:	4629                	li	a2,10
 4b0:	000ba583          	lw	a1,0(s7)
 4b4:	855a                	mv	a0,s6
 4b6:	e91ff0ef          	jal	346 <printint>
 4ba:	8bca                	mv	s7,s2
      state = 0;
 4bc:	4981                	li	s3,0
 4be:	bfad                	j	438 <vprintf+0x4a>
      } else if(c0 == 'l' && c1 == 'd'){
 4c0:	06400793          	li	a5,100
 4c4:	02f68963          	beq	a3,a5,4f6 <vprintf+0x108>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 4c8:	06c00793          	li	a5,108
 4cc:	04f68263          	beq	a3,a5,510 <vprintf+0x122>
      } else if(c0 == 'l' && c1 == 'u'){
 4d0:	07500793          	li	a5,117
 4d4:	0af68063          	beq	a3,a5,574 <vprintf+0x186>
      } else if(c0 == 'l' && c1 == 'x'){
 4d8:	07800793          	li	a5,120
 4dc:	0ef68263          	beq	a3,a5,5c0 <vprintf+0x1d2>
        putc(fd, '%');
 4e0:	02500593          	li	a1,37
 4e4:	855a                	mv	a0,s6
 4e6:	e43ff0ef          	jal	328 <putc>
        putc(fd, c0);
 4ea:	85ca                	mv	a1,s2
 4ec:	855a                	mv	a0,s6
 4ee:	e3bff0ef          	jal	328 <putc>
      state = 0;
 4f2:	4981                	li	s3,0
 4f4:	b791                	j	438 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 1);
 4f6:	008b8913          	addi	s2,s7,8
 4fa:	4685                	li	a3,1
 4fc:	4629                	li	a2,10
 4fe:	000ba583          	lw	a1,0(s7)
 502:	855a                	mv	a0,s6
 504:	e43ff0ef          	jal	346 <printint>
        i += 1;
 508:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 1);
 50a:	8bca                	mv	s7,s2
      state = 0;
 50c:	4981                	li	s3,0
        i += 1;
 50e:	b72d                	j	438 <vprintf+0x4a>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 510:	06400793          	li	a5,100
 514:	02f60763          	beq	a2,a5,542 <vprintf+0x154>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
 518:	07500793          	li	a5,117
 51c:	06f60963          	beq	a2,a5,58e <vprintf+0x1a0>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
 520:	07800793          	li	a5,120
 524:	faf61ee3          	bne	a2,a5,4e0 <vprintf+0xf2>
        printint(fd, va_arg(ap, uint64), 16, 0);
 528:	008b8913          	addi	s2,s7,8
 52c:	4681                	li	a3,0
 52e:	4641                	li	a2,16
 530:	000ba583          	lw	a1,0(s7)
 534:	855a                	mv	a0,s6
 536:	e11ff0ef          	jal	346 <printint>
        i += 2;
 53a:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 16, 0);
 53c:	8bca                	mv	s7,s2
      state = 0;
 53e:	4981                	li	s3,0
        i += 2;
 540:	bde5                	j	438 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 1);
 542:	008b8913          	addi	s2,s7,8
 546:	4685                	li	a3,1
 548:	4629                	li	a2,10
 54a:	000ba583          	lw	a1,0(s7)
 54e:	855a                	mv	a0,s6
 550:	df7ff0ef          	jal	346 <printint>
        i += 2;
 554:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 1);
 556:	8bca                	mv	s7,s2
      state = 0;
 558:	4981                	li	s3,0
        i += 2;
 55a:	bdf9                	j	438 <vprintf+0x4a>
        printint(fd, va_arg(ap, int), 10, 0);
 55c:	008b8913          	addi	s2,s7,8
 560:	4681                	li	a3,0
 562:	4629                	li	a2,10
 564:	000ba583          	lw	a1,0(s7)
 568:	855a                	mv	a0,s6
 56a:	dddff0ef          	jal	346 <printint>
 56e:	8bca                	mv	s7,s2
      state = 0;
 570:	4981                	li	s3,0
 572:	b5d9                	j	438 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 0);
 574:	008b8913          	addi	s2,s7,8
 578:	4681                	li	a3,0
 57a:	4629                	li	a2,10
 57c:	000ba583          	lw	a1,0(s7)
 580:	855a                	mv	a0,s6
 582:	dc5ff0ef          	jal	346 <printint>
        i += 1;
 586:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 0);
 588:	8bca                	mv	s7,s2
      state = 0;
 58a:	4981                	li	s3,0
        i += 1;
 58c:	b575                	j	438 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 10, 0);
 58e:	008b8913          	addi	s2,s7,8
 592:	4681                	li	a3,0
 594:	4629                	li	a2,10
 596:	000ba583          	lw	a1,0(s7)
 59a:	855a                	mv	a0,s6
 59c:	dabff0ef          	jal	346 <printint>
        i += 2;
 5a0:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 0);
 5a2:	8bca                	mv	s7,s2
      state = 0;
 5a4:	4981                	li	s3,0
        i += 2;
 5a6:	bd49                	j	438 <vprintf+0x4a>
        printint(fd, va_arg(ap, int), 16, 0);
 5a8:	008b8913          	addi	s2,s7,8
 5ac:	4681                	li	a3,0
 5ae:	4641                	li	a2,16
 5b0:	000ba583          	lw	a1,0(s7)
 5b4:	855a                	mv	a0,s6
 5b6:	d91ff0ef          	jal	346 <printint>
 5ba:	8bca                	mv	s7,s2
      state = 0;
 5bc:	4981                	li	s3,0
 5be:	bdad                	j	438 <vprintf+0x4a>
        printint(fd, va_arg(ap, uint64), 16, 0);
 5c0:	008b8913          	addi	s2,s7,8
 5c4:	4681                	li	a3,0
 5c6:	4641                	li	a2,16
 5c8:	000ba583          	lw	a1,0(s7)
 5cc:	855a                	mv	a0,s6
 5ce:	d79ff0ef          	jal	346 <printint>
        i += 1;
 5d2:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 16, 0);
 5d4:	8bca                	mv	s7,s2
      state = 0;
 5d6:	4981                	li	s3,0
        i += 1;
 5d8:	b585                	j	438 <vprintf+0x4a>
 5da:	e06a                	sd	s10,0(sp)
        printptr(fd, va_arg(ap, uint64));
 5dc:	008b8d13          	addi	s10,s7,8
 5e0:	000bb983          	ld	s3,0(s7)
  putc(fd, '0');
 5e4:	03000593          	li	a1,48
 5e8:	855a                	mv	a0,s6
 5ea:	d3fff0ef          	jal	328 <putc>
  putc(fd, 'x');
 5ee:	07800593          	li	a1,120
 5f2:	855a                	mv	a0,s6
 5f4:	d35ff0ef          	jal	328 <putc>
 5f8:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5fa:	00000b97          	auipc	s7,0x0
 5fe:	25eb8b93          	addi	s7,s7,606 # 858 <digits>
 602:	03c9d793          	srli	a5,s3,0x3c
 606:	97de                	add	a5,a5,s7
 608:	0007c583          	lbu	a1,0(a5)
 60c:	855a                	mv	a0,s6
 60e:	d1bff0ef          	jal	328 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 612:	0992                	slli	s3,s3,0x4
 614:	397d                	addiw	s2,s2,-1
 616:	fe0916e3          	bnez	s2,602 <vprintf+0x214>
        printptr(fd, va_arg(ap, uint64));
 61a:	8bea                	mv	s7,s10
      state = 0;
 61c:	4981                	li	s3,0
 61e:	6d02                	ld	s10,0(sp)
 620:	bd21                	j	438 <vprintf+0x4a>
        if((s = va_arg(ap, char*)) == 0)
 622:	008b8993          	addi	s3,s7,8
 626:	000bb903          	ld	s2,0(s7)
 62a:	00090f63          	beqz	s2,648 <vprintf+0x25a>
        for(; *s; s++)
 62e:	00094583          	lbu	a1,0(s2)
 632:	c195                	beqz	a1,656 <vprintf+0x268>
          putc(fd, *s);
 634:	855a                	mv	a0,s6
 636:	cf3ff0ef          	jal	328 <putc>
        for(; *s; s++)
 63a:	0905                	addi	s2,s2,1
 63c:	00094583          	lbu	a1,0(s2)
 640:	f9f5                	bnez	a1,634 <vprintf+0x246>
        if((s = va_arg(ap, char*)) == 0)
 642:	8bce                	mv	s7,s3
      state = 0;
 644:	4981                	li	s3,0
 646:	bbcd                	j	438 <vprintf+0x4a>
          s = "(null)";
 648:	00000917          	auipc	s2,0x0
 64c:	20890913          	addi	s2,s2,520 # 850 <malloc+0xfc>
        for(; *s; s++)
 650:	02800593          	li	a1,40
 654:	b7c5                	j	634 <vprintf+0x246>
        if((s = va_arg(ap, char*)) == 0)
 656:	8bce                	mv	s7,s3
      state = 0;
 658:	4981                	li	s3,0
 65a:	bbf9                	j	438 <vprintf+0x4a>
 65c:	64a6                	ld	s1,72(sp)
 65e:	79e2                	ld	s3,56(sp)
 660:	7a42                	ld	s4,48(sp)
 662:	7aa2                	ld	s5,40(sp)
 664:	7b02                	ld	s6,32(sp)
 666:	6be2                	ld	s7,24(sp)
 668:	6c42                	ld	s8,16(sp)
 66a:	6ca2                	ld	s9,8(sp)
    }
  }
}
 66c:	60e6                	ld	ra,88(sp)
 66e:	6446                	ld	s0,80(sp)
 670:	6906                	ld	s2,64(sp)
 672:	6125                	addi	sp,sp,96
 674:	8082                	ret

0000000000000676 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 676:	715d                	addi	sp,sp,-80
 678:	ec06                	sd	ra,24(sp)
 67a:	e822                	sd	s0,16(sp)
 67c:	1000                	addi	s0,sp,32
 67e:	e010                	sd	a2,0(s0)
 680:	e414                	sd	a3,8(s0)
 682:	e818                	sd	a4,16(s0)
 684:	ec1c                	sd	a5,24(s0)
 686:	03043023          	sd	a6,32(s0)
 68a:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 68e:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 692:	8622                	mv	a2,s0
 694:	d5bff0ef          	jal	3ee <vprintf>
}
 698:	60e2                	ld	ra,24(sp)
 69a:	6442                	ld	s0,16(sp)
 69c:	6161                	addi	sp,sp,80
 69e:	8082                	ret

00000000000006a0 <printf>:

void
printf(const char *fmt, ...)
{
 6a0:	711d                	addi	sp,sp,-96
 6a2:	ec06                	sd	ra,24(sp)
 6a4:	e822                	sd	s0,16(sp)
 6a6:	1000                	addi	s0,sp,32
 6a8:	e40c                	sd	a1,8(s0)
 6aa:	e810                	sd	a2,16(s0)
 6ac:	ec14                	sd	a3,24(s0)
 6ae:	f018                	sd	a4,32(s0)
 6b0:	f41c                	sd	a5,40(s0)
 6b2:	03043823          	sd	a6,48(s0)
 6b6:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 6ba:	00840613          	addi	a2,s0,8
 6be:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 6c2:	85aa                	mv	a1,a0
 6c4:	4505                	li	a0,1
 6c6:	d29ff0ef          	jal	3ee <vprintf>
}
 6ca:	60e2                	ld	ra,24(sp)
 6cc:	6442                	ld	s0,16(sp)
 6ce:	6125                	addi	sp,sp,96
 6d0:	8082                	ret

00000000000006d2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d2:	1141                	addi	sp,sp,-16
 6d4:	e422                	sd	s0,8(sp)
 6d6:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6d8:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6dc:	00001797          	auipc	a5,0x1
 6e0:	9247b783          	ld	a5,-1756(a5) # 1000 <freep>
 6e4:	a02d                	j	70e <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 6e6:	4618                	lw	a4,8(a2)
 6e8:	9f2d                	addw	a4,a4,a1
 6ea:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 6ee:	6398                	ld	a4,0(a5)
 6f0:	6310                	ld	a2,0(a4)
 6f2:	a83d                	j	730 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 6f4:	ff852703          	lw	a4,-8(a0)
 6f8:	9f31                	addw	a4,a4,a2
 6fa:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 6fc:	ff053683          	ld	a3,-16(a0)
 700:	a091                	j	744 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 702:	6398                	ld	a4,0(a5)
 704:	00e7e463          	bltu	a5,a4,70c <free+0x3a>
 708:	00e6ea63          	bltu	a3,a4,71c <free+0x4a>
{
 70c:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 70e:	fed7fae3          	bgeu	a5,a3,702 <free+0x30>
 712:	6398                	ld	a4,0(a5)
 714:	00e6e463          	bltu	a3,a4,71c <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 718:	fee7eae3          	bltu	a5,a4,70c <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 71c:	ff852583          	lw	a1,-8(a0)
 720:	6390                	ld	a2,0(a5)
 722:	02059813          	slli	a6,a1,0x20
 726:	01c85713          	srli	a4,a6,0x1c
 72a:	9736                	add	a4,a4,a3
 72c:	fae60de3          	beq	a2,a4,6e6 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 730:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 734:	4790                	lw	a2,8(a5)
 736:	02061593          	slli	a1,a2,0x20
 73a:	01c5d713          	srli	a4,a1,0x1c
 73e:	973e                	add	a4,a4,a5
 740:	fae68ae3          	beq	a3,a4,6f4 <free+0x22>
    p->s.ptr = bp->s.ptr;
 744:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 746:	00001717          	auipc	a4,0x1
 74a:	8af73d23          	sd	a5,-1862(a4) # 1000 <freep>
}
 74e:	6422                	ld	s0,8(sp)
 750:	0141                	addi	sp,sp,16
 752:	8082                	ret

0000000000000754 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 754:	7139                	addi	sp,sp,-64
 756:	fc06                	sd	ra,56(sp)
 758:	f822                	sd	s0,48(sp)
 75a:	f426                	sd	s1,40(sp)
 75c:	ec4e                	sd	s3,24(sp)
 75e:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 760:	02051493          	slli	s1,a0,0x20
 764:	9081                	srli	s1,s1,0x20
 766:	04bd                	addi	s1,s1,15
 768:	8091                	srli	s1,s1,0x4
 76a:	0014899b          	addiw	s3,s1,1
 76e:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 770:	00001517          	auipc	a0,0x1
 774:	89053503          	ld	a0,-1904(a0) # 1000 <freep>
 778:	c915                	beqz	a0,7ac <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 77a:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 77c:	4798                	lw	a4,8(a5)
 77e:	08977a63          	bgeu	a4,s1,812 <malloc+0xbe>
 782:	f04a                	sd	s2,32(sp)
 784:	e852                	sd	s4,16(sp)
 786:	e456                	sd	s5,8(sp)
 788:	e05a                	sd	s6,0(sp)
  if(nu < 4096)
 78a:	8a4e                	mv	s4,s3
 78c:	0009871b          	sext.w	a4,s3
 790:	6685                	lui	a3,0x1
 792:	00d77363          	bgeu	a4,a3,798 <malloc+0x44>
 796:	6a05                	lui	s4,0x1
 798:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 79c:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7a0:	00001917          	auipc	s2,0x1
 7a4:	86090913          	addi	s2,s2,-1952 # 1000 <freep>
  if(p == (char*)-1)
 7a8:	5afd                	li	s5,-1
 7aa:	a081                	j	7ea <malloc+0x96>
 7ac:	f04a                	sd	s2,32(sp)
 7ae:	e852                	sd	s4,16(sp)
 7b0:	e456                	sd	s5,8(sp)
 7b2:	e05a                	sd	s6,0(sp)
    base.s.ptr = freep = prevp = &base;
 7b4:	00001797          	auipc	a5,0x1
 7b8:	85c78793          	addi	a5,a5,-1956 # 1010 <base>
 7bc:	00001717          	auipc	a4,0x1
 7c0:	84f73223          	sd	a5,-1980(a4) # 1000 <freep>
 7c4:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 7c6:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 7ca:	b7c1                	j	78a <malloc+0x36>
        prevp->s.ptr = p->s.ptr;
 7cc:	6398                	ld	a4,0(a5)
 7ce:	e118                	sd	a4,0(a0)
 7d0:	a8a9                	j	82a <malloc+0xd6>
  hp->s.size = nu;
 7d2:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 7d6:	0541                	addi	a0,a0,16
 7d8:	efbff0ef          	jal	6d2 <free>
  return freep;
 7dc:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 7e0:	c12d                	beqz	a0,842 <malloc+0xee>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e2:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 7e4:	4798                	lw	a4,8(a5)
 7e6:	02977263          	bgeu	a4,s1,80a <malloc+0xb6>
    if(p == freep)
 7ea:	00093703          	ld	a4,0(s2)
 7ee:	853e                	mv	a0,a5
 7f0:	fef719e3          	bne	a4,a5,7e2 <malloc+0x8e>
  p = sbrk(nu * sizeof(Header));
 7f4:	8552                	mv	a0,s4
 7f6:	b13ff0ef          	jal	308 <sbrk>
  if(p == (char*)-1)
 7fa:	fd551ce3          	bne	a0,s5,7d2 <malloc+0x7e>
        return 0;
 7fe:	4501                	li	a0,0
 800:	7902                	ld	s2,32(sp)
 802:	6a42                	ld	s4,16(sp)
 804:	6aa2                	ld	s5,8(sp)
 806:	6b02                	ld	s6,0(sp)
 808:	a03d                	j	836 <malloc+0xe2>
 80a:	7902                	ld	s2,32(sp)
 80c:	6a42                	ld	s4,16(sp)
 80e:	6aa2                	ld	s5,8(sp)
 810:	6b02                	ld	s6,0(sp)
      if(p->s.size == nunits)
 812:	fae48de3          	beq	s1,a4,7cc <malloc+0x78>
        p->s.size -= nunits;
 816:	4137073b          	subw	a4,a4,s3
 81a:	c798                	sw	a4,8(a5)
        p += p->s.size;
 81c:	02071693          	slli	a3,a4,0x20
 820:	01c6d713          	srli	a4,a3,0x1c
 824:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 826:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 82a:	00000717          	auipc	a4,0x0
 82e:	7ca73b23          	sd	a0,2006(a4) # 1000 <freep>
      return (void*)(p + 1);
 832:	01078513          	addi	a0,a5,16
  }
}
 836:	70e2                	ld	ra,56(sp)
 838:	7442                	ld	s0,48(sp)
 83a:	74a2                	ld	s1,40(sp)
 83c:	69e2                	ld	s3,24(sp)
 83e:	6121                	addi	sp,sp,64
 840:	8082                	ret
 842:	7902                	ld	s2,32(sp)
 844:	6a42                	ld	s4,16(sp)
 846:	6aa2                	ld	s5,8(sp)
 848:	6b02                	ld	s6,0(sp)
 84a:	b7f5                	j	836 <malloc+0xe2>
