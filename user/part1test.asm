
user/_part1test:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <t1Test>:
#include <stddef.h>


/* Sanity test for task 1*/
void
t1Test(void){
   0:	bb010113          	addi	sp,sp,-1104
   4:	44113423          	sd	ra,1096(sp)
   8:	44813023          	sd	s0,1088(sp)
   c:	42913c23          	sd	s1,1080(sp)
  10:	43213823          	sd	s2,1072(sp)
  14:	43313423          	sd	s3,1064(sp)
  18:	43413023          	sd	s4,1056(sp)
  1c:	41513c23          	sd	s5,1048(sp)
  20:	41613823          	sd	s6,1040(sp)
  24:	41713423          	sd	s7,1032(sp)
  28:	41813023          	sd	s8,1024(sp)
  2c:	45010413          	addi	s0,sp,1104
	printf("running sanity test for task1\n");
  30:	00001517          	auipc	a0,0x1
  34:	8d050513          	addi	a0,a0,-1840 # 900 <malloc+0xea>
  38:	00000097          	auipc	ra,0x0
  3c:	720080e7          	jalr	1824(ra) # 758 <printf>

	int fd;
	char data[1024];
	int numBytes;	//just to check the length
	// fills the data array with 7s
	memset(data, 7, 1024);
  40:	40000613          	li	a2,1024
  44:	459d                	li	a1,7
  46:	bb040513          	addi	a0,s0,-1104
  4a:	00000097          	auipc	ra,0x0
  4e:	192080e7          	jalr	402(ra) # 1dc <memset>

	if((fd = open("/home/os/t1Sanity.txt", O_CREATE |O_TRUNC | O_RDWR )) != -1){
  52:	60200593          	li	a1,1538
  56:	00001517          	auipc	a0,0x1
  5a:	8ca50513          	addi	a0,a0,-1846 # 920 <malloc+0x10a>
  5e:	00000097          	auipc	ra,0x0
  62:	3c2080e7          	jalr	962(ra) # 420 <open>
  66:	57fd                	li	a5,-1
  68:	0cf50363          	beq	a0,a5,12e <t1Test+0x12e>
  6c:	89aa                	mv	s3,a0
        numBytes = fd; //set initial position
  6e:	892a                	mv	s2,a0
  70:	4481                	li	s1,0
        
        for(int i = 0; i < 1024 * 10; i++){
            numBytes += write(fd, data, sizeof(data));
            if (i == 12)
  72:	4a31                	li	s4,12
                printf("Finished writing 12KB (direct)\n");
            if (i == 268)
  74:	10c00a93          	li	s5,268
        for(int i = 0; i < 1024 * 10; i++){
  78:	6b09                	lui	s6,0x2
  7a:	7ffb0b13          	addi	s6,s6,2047 # 27ff <__global_pointer$+0x15e6>
                printf("Finished writing 268KB (single direct)\n");
  7e:	00001c17          	auipc	s8,0x1
  82:	8dac0c13          	addi	s8,s8,-1830 # 958 <malloc+0x142>
                printf("Finished writing 12KB (direct)\n");
  86:	00001b97          	auipc	s7,0x1
  8a:	8b2b8b93          	addi	s7,s7,-1870 # 938 <malloc+0x122>
  8e:	a039                	j	9c <t1Test+0x9c>
  90:	855e                	mv	a0,s7
  92:	00000097          	auipc	ra,0x0
  96:	6c6080e7          	jalr	1734(ra) # 758 <printf>
        for(int i = 0; i < 1024 * 10; i++){
  9a:	2485                	addiw	s1,s1,1
            numBytes += write(fd, data, sizeof(data));
  9c:	40000613          	li	a2,1024
  a0:	bb040593          	addi	a1,s0,-1104
  a4:	854e                	mv	a0,s3
  a6:	00000097          	auipc	ra,0x0
  aa:	35a080e7          	jalr	858(ra) # 400 <write>
  ae:	0125093b          	addw	s2,a0,s2
            if (i == 12)
  b2:	0004879b          	sext.w	a5,s1
  b6:	fd478de3          	beq	a5,s4,90 <t1Test+0x90>
            if (i == 268)
  ba:	05578b63          	beq	a5,s5,110 <t1Test+0x110>
        for(int i = 0; i < 1024 * 10; i++){
  be:	0014879b          	addiw	a5,s1,1
  c2:	fcfb5ce3          	bge	s6,a5,9a <t1Test+0x9a>
        }
        
        // checking the we indeed wrote 1MB data
        // NOTE: using ls after the test we can see the file
        //		 and its size in the file system of QEMU
        if(numBytes - fd == 1024*1024*10)
  c6:	4139093b          	subw	s2,s2,s3
  ca:	00a007b7          	lui	a5,0xa00
  ce:	04f90763          	beq	s2,a5,11c <t1Test+0x11c>
            printf("Finished writing 10MB\ntest finished successfuly\n");
        else
            printf("test FAILED!!\n");
  d2:	00001517          	auipc	a0,0x1
  d6:	8e650513          	addi	a0,a0,-1818 # 9b8 <malloc+0x1a2>
  da:	00000097          	auipc	ra,0x0
  de:	67e080e7          	jalr	1662(ra) # 758 <printf>
    }
      else
            printf("test FAILED open file!!\n");
}
  e2:	44813083          	ld	ra,1096(sp)
  e6:	44013403          	ld	s0,1088(sp)
  ea:	43813483          	ld	s1,1080(sp)
  ee:	43013903          	ld	s2,1072(sp)
  f2:	42813983          	ld	s3,1064(sp)
  f6:	42013a03          	ld	s4,1056(sp)
  fa:	41813a83          	ld	s5,1048(sp)
  fe:	41013b03          	ld	s6,1040(sp)
 102:	40813b83          	ld	s7,1032(sp)
 106:	40013c03          	ld	s8,1024(sp)
 10a:	45010113          	addi	sp,sp,1104
 10e:	8082                	ret
                printf("Finished writing 268KB (single direct)\n");
 110:	8562                	mv	a0,s8
 112:	00000097          	auipc	ra,0x0
 116:	646080e7          	jalr	1606(ra) # 758 <printf>
        for(int i = 0; i < 1024 * 10; i++){
 11a:	b741                	j	9a <t1Test+0x9a>
            printf("Finished writing 10MB\ntest finished successfuly\n");
 11c:	00001517          	auipc	a0,0x1
 120:	86450513          	addi	a0,a0,-1948 # 980 <malloc+0x16a>
 124:	00000097          	auipc	ra,0x0
 128:	634080e7          	jalr	1588(ra) # 758 <printf>
 12c:	bf5d                	j	e2 <t1Test+0xe2>
            printf("test FAILED open file!!\n");
 12e:	00001517          	auipc	a0,0x1
 132:	89a50513          	addi	a0,a0,-1894 # 9c8 <malloc+0x1b2>
 136:	00000097          	auipc	ra,0x0
 13a:	622080e7          	jalr	1570(ra) # 758 <printf>
}
 13e:	b755                	j	e2 <t1Test+0xe2>

0000000000000140 <main>:

int main(int argc, char* argv[]){
 140:	1141                	addi	sp,sp,-16
 142:	e406                	sd	ra,8(sp)
 144:	e022                	sd	s0,0(sp)
 146:	0800                	addi	s0,sp,16
	printf("**Sanity Tests**\n");
 148:	00001517          	auipc	a0,0x1
 14c:	8a050513          	addi	a0,a0,-1888 # 9e8 <malloc+0x1d2>
 150:	00000097          	auipc	ra,0x0
 154:	608080e7          	jalr	1544(ra) # 758 <printf>
	t1Test();
 158:	00000097          	auipc	ra,0x0
 15c:	ea8080e7          	jalr	-344(ra) # 0 <t1Test>
	exit(0);
 160:	4501                	li	a0,0
 162:	00000097          	auipc	ra,0x0
 166:	27e080e7          	jalr	638(ra) # 3e0 <exit>

000000000000016a <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 16a:	1141                	addi	sp,sp,-16
 16c:	e422                	sd	s0,8(sp)
 16e:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 170:	87aa                	mv	a5,a0
 172:	0585                	addi	a1,a1,1
 174:	0785                	addi	a5,a5,1
 176:	fff5c703          	lbu	a4,-1(a1)
 17a:	fee78fa3          	sb	a4,-1(a5) # 9fffff <__global_pointer$+0x9fede6>
 17e:	fb75                	bnez	a4,172 <strcpy+0x8>
    ;
  return os;
}
 180:	6422                	ld	s0,8(sp)
 182:	0141                	addi	sp,sp,16
 184:	8082                	ret

0000000000000186 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 186:	1141                	addi	sp,sp,-16
 188:	e422                	sd	s0,8(sp)
 18a:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 18c:	00054783          	lbu	a5,0(a0)
 190:	cb91                	beqz	a5,1a4 <strcmp+0x1e>
 192:	0005c703          	lbu	a4,0(a1)
 196:	00f71763          	bne	a4,a5,1a4 <strcmp+0x1e>
    p++, q++;
 19a:	0505                	addi	a0,a0,1
 19c:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 19e:	00054783          	lbu	a5,0(a0)
 1a2:	fbe5                	bnez	a5,192 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 1a4:	0005c503          	lbu	a0,0(a1)
}
 1a8:	40a7853b          	subw	a0,a5,a0
 1ac:	6422                	ld	s0,8(sp)
 1ae:	0141                	addi	sp,sp,16
 1b0:	8082                	ret

00000000000001b2 <strlen>:

uint
strlen(const char *s)
{
 1b2:	1141                	addi	sp,sp,-16
 1b4:	e422                	sd	s0,8(sp)
 1b6:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 1b8:	00054783          	lbu	a5,0(a0)
 1bc:	cf91                	beqz	a5,1d8 <strlen+0x26>
 1be:	0505                	addi	a0,a0,1
 1c0:	87aa                	mv	a5,a0
 1c2:	4685                	li	a3,1
 1c4:	9e89                	subw	a3,a3,a0
 1c6:	00f6853b          	addw	a0,a3,a5
 1ca:	0785                	addi	a5,a5,1
 1cc:	fff7c703          	lbu	a4,-1(a5)
 1d0:	fb7d                	bnez	a4,1c6 <strlen+0x14>
    ;
  return n;
}
 1d2:	6422                	ld	s0,8(sp)
 1d4:	0141                	addi	sp,sp,16
 1d6:	8082                	ret
  for(n = 0; s[n]; n++)
 1d8:	4501                	li	a0,0
 1da:	bfe5                	j	1d2 <strlen+0x20>

00000000000001dc <memset>:

void*
memset(void *dst, int c, uint n)
{
 1dc:	1141                	addi	sp,sp,-16
 1de:	e422                	sd	s0,8(sp)
 1e0:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 1e2:	ce09                	beqz	a2,1fc <memset+0x20>
 1e4:	87aa                	mv	a5,a0
 1e6:	fff6071b          	addiw	a4,a2,-1
 1ea:	1702                	slli	a4,a4,0x20
 1ec:	9301                	srli	a4,a4,0x20
 1ee:	0705                	addi	a4,a4,1
 1f0:	972a                	add	a4,a4,a0
    cdst[i] = c;
 1f2:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 1f6:	0785                	addi	a5,a5,1
 1f8:	fee79de3          	bne	a5,a4,1f2 <memset+0x16>
  }
  return dst;
}
 1fc:	6422                	ld	s0,8(sp)
 1fe:	0141                	addi	sp,sp,16
 200:	8082                	ret

0000000000000202 <strchr>:

char*
strchr(const char *s, char c)
{
 202:	1141                	addi	sp,sp,-16
 204:	e422                	sd	s0,8(sp)
 206:	0800                	addi	s0,sp,16
  for(; *s; s++)
 208:	00054783          	lbu	a5,0(a0)
 20c:	cb99                	beqz	a5,222 <strchr+0x20>
    if(*s == c)
 20e:	00f58763          	beq	a1,a5,21c <strchr+0x1a>
  for(; *s; s++)
 212:	0505                	addi	a0,a0,1
 214:	00054783          	lbu	a5,0(a0)
 218:	fbfd                	bnez	a5,20e <strchr+0xc>
      return (char*)s;
  return 0;
 21a:	4501                	li	a0,0
}
 21c:	6422                	ld	s0,8(sp)
 21e:	0141                	addi	sp,sp,16
 220:	8082                	ret
  return 0;
 222:	4501                	li	a0,0
 224:	bfe5                	j	21c <strchr+0x1a>

0000000000000226 <gets>:

char*
gets(char *buf, int max)
{
 226:	711d                	addi	sp,sp,-96
 228:	ec86                	sd	ra,88(sp)
 22a:	e8a2                	sd	s0,80(sp)
 22c:	e4a6                	sd	s1,72(sp)
 22e:	e0ca                	sd	s2,64(sp)
 230:	fc4e                	sd	s3,56(sp)
 232:	f852                	sd	s4,48(sp)
 234:	f456                	sd	s5,40(sp)
 236:	f05a                	sd	s6,32(sp)
 238:	ec5e                	sd	s7,24(sp)
 23a:	1080                	addi	s0,sp,96
 23c:	8baa                	mv	s7,a0
 23e:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 240:	892a                	mv	s2,a0
 242:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 244:	4aa9                	li	s5,10
 246:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 248:	89a6                	mv	s3,s1
 24a:	2485                	addiw	s1,s1,1
 24c:	0344d863          	bge	s1,s4,27c <gets+0x56>
    cc = read(0, &c, 1);
 250:	4605                	li	a2,1
 252:	faf40593          	addi	a1,s0,-81
 256:	4501                	li	a0,0
 258:	00000097          	auipc	ra,0x0
 25c:	1a0080e7          	jalr	416(ra) # 3f8 <read>
    if(cc < 1)
 260:	00a05e63          	blez	a0,27c <gets+0x56>
    buf[i++] = c;
 264:	faf44783          	lbu	a5,-81(s0)
 268:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 26c:	01578763          	beq	a5,s5,27a <gets+0x54>
 270:	0905                	addi	s2,s2,1
 272:	fd679be3          	bne	a5,s6,248 <gets+0x22>
  for(i=0; i+1 < max; ){
 276:	89a6                	mv	s3,s1
 278:	a011                	j	27c <gets+0x56>
 27a:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 27c:	99de                	add	s3,s3,s7
 27e:	00098023          	sb	zero,0(s3)
  return buf;
}
 282:	855e                	mv	a0,s7
 284:	60e6                	ld	ra,88(sp)
 286:	6446                	ld	s0,80(sp)
 288:	64a6                	ld	s1,72(sp)
 28a:	6906                	ld	s2,64(sp)
 28c:	79e2                	ld	s3,56(sp)
 28e:	7a42                	ld	s4,48(sp)
 290:	7aa2                	ld	s5,40(sp)
 292:	7b02                	ld	s6,32(sp)
 294:	6be2                	ld	s7,24(sp)
 296:	6125                	addi	sp,sp,96
 298:	8082                	ret

000000000000029a <stat>:

int
stat(const char *n, struct stat *st)
{
 29a:	1101                	addi	sp,sp,-32
 29c:	ec06                	sd	ra,24(sp)
 29e:	e822                	sd	s0,16(sp)
 2a0:	e426                	sd	s1,8(sp)
 2a2:	e04a                	sd	s2,0(sp)
 2a4:	1000                	addi	s0,sp,32
 2a6:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a8:	4581                	li	a1,0
 2aa:	00000097          	auipc	ra,0x0
 2ae:	176080e7          	jalr	374(ra) # 420 <open>
  if(fd < 0)
 2b2:	02054563          	bltz	a0,2dc <stat+0x42>
 2b6:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 2b8:	85ca                	mv	a1,s2
 2ba:	00000097          	auipc	ra,0x0
 2be:	17e080e7          	jalr	382(ra) # 438 <fstat>
 2c2:	892a                	mv	s2,a0
  close(fd);
 2c4:	8526                	mv	a0,s1
 2c6:	00000097          	auipc	ra,0x0
 2ca:	142080e7          	jalr	322(ra) # 408 <close>
  return r;
}
 2ce:	854a                	mv	a0,s2
 2d0:	60e2                	ld	ra,24(sp)
 2d2:	6442                	ld	s0,16(sp)
 2d4:	64a2                	ld	s1,8(sp)
 2d6:	6902                	ld	s2,0(sp)
 2d8:	6105                	addi	sp,sp,32
 2da:	8082                	ret
    return -1;
 2dc:	597d                	li	s2,-1
 2de:	bfc5                	j	2ce <stat+0x34>

00000000000002e0 <atoi>:

int
atoi(const char *s)
{
 2e0:	1141                	addi	sp,sp,-16
 2e2:	e422                	sd	s0,8(sp)
 2e4:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2e6:	00054603          	lbu	a2,0(a0)
 2ea:	fd06079b          	addiw	a5,a2,-48
 2ee:	0ff7f793          	andi	a5,a5,255
 2f2:	4725                	li	a4,9
 2f4:	02f76963          	bltu	a4,a5,326 <atoi+0x46>
 2f8:	86aa                	mv	a3,a0
  n = 0;
 2fa:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 2fc:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 2fe:	0685                	addi	a3,a3,1
 300:	0025179b          	slliw	a5,a0,0x2
 304:	9fa9                	addw	a5,a5,a0
 306:	0017979b          	slliw	a5,a5,0x1
 30a:	9fb1                	addw	a5,a5,a2
 30c:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 310:	0006c603          	lbu	a2,0(a3)
 314:	fd06071b          	addiw	a4,a2,-48
 318:	0ff77713          	andi	a4,a4,255
 31c:	fee5f1e3          	bgeu	a1,a4,2fe <atoi+0x1e>
  return n;
}
 320:	6422                	ld	s0,8(sp)
 322:	0141                	addi	sp,sp,16
 324:	8082                	ret
  n = 0;
 326:	4501                	li	a0,0
 328:	bfe5                	j	320 <atoi+0x40>

000000000000032a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 32a:	1141                	addi	sp,sp,-16
 32c:	e422                	sd	s0,8(sp)
 32e:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 330:	02b57663          	bgeu	a0,a1,35c <memmove+0x32>
    while(n-- > 0)
 334:	02c05163          	blez	a2,356 <memmove+0x2c>
 338:	fff6079b          	addiw	a5,a2,-1
 33c:	1782                	slli	a5,a5,0x20
 33e:	9381                	srli	a5,a5,0x20
 340:	0785                	addi	a5,a5,1
 342:	97aa                	add	a5,a5,a0
  dst = vdst;
 344:	872a                	mv	a4,a0
      *dst++ = *src++;
 346:	0585                	addi	a1,a1,1
 348:	0705                	addi	a4,a4,1
 34a:	fff5c683          	lbu	a3,-1(a1)
 34e:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 352:	fee79ae3          	bne	a5,a4,346 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 356:	6422                	ld	s0,8(sp)
 358:	0141                	addi	sp,sp,16
 35a:	8082                	ret
    dst += n;
 35c:	00c50733          	add	a4,a0,a2
    src += n;
 360:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 362:	fec05ae3          	blez	a2,356 <memmove+0x2c>
 366:	fff6079b          	addiw	a5,a2,-1
 36a:	1782                	slli	a5,a5,0x20
 36c:	9381                	srli	a5,a5,0x20
 36e:	fff7c793          	not	a5,a5
 372:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 374:	15fd                	addi	a1,a1,-1
 376:	177d                	addi	a4,a4,-1
 378:	0005c683          	lbu	a3,0(a1)
 37c:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 380:	fee79ae3          	bne	a5,a4,374 <memmove+0x4a>
 384:	bfc9                	j	356 <memmove+0x2c>

0000000000000386 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 386:	1141                	addi	sp,sp,-16
 388:	e422                	sd	s0,8(sp)
 38a:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 38c:	ca05                	beqz	a2,3bc <memcmp+0x36>
 38e:	fff6069b          	addiw	a3,a2,-1
 392:	1682                	slli	a3,a3,0x20
 394:	9281                	srli	a3,a3,0x20
 396:	0685                	addi	a3,a3,1
 398:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 39a:	00054783          	lbu	a5,0(a0)
 39e:	0005c703          	lbu	a4,0(a1)
 3a2:	00e79863          	bne	a5,a4,3b2 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 3a6:	0505                	addi	a0,a0,1
    p2++;
 3a8:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 3aa:	fed518e3          	bne	a0,a3,39a <memcmp+0x14>
  }
  return 0;
 3ae:	4501                	li	a0,0
 3b0:	a019                	j	3b6 <memcmp+0x30>
      return *p1 - *p2;
 3b2:	40e7853b          	subw	a0,a5,a4
}
 3b6:	6422                	ld	s0,8(sp)
 3b8:	0141                	addi	sp,sp,16
 3ba:	8082                	ret
  return 0;
 3bc:	4501                	li	a0,0
 3be:	bfe5                	j	3b6 <memcmp+0x30>

00000000000003c0 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 3c0:	1141                	addi	sp,sp,-16
 3c2:	e406                	sd	ra,8(sp)
 3c4:	e022                	sd	s0,0(sp)
 3c6:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 3c8:	00000097          	auipc	ra,0x0
 3cc:	f62080e7          	jalr	-158(ra) # 32a <memmove>
}
 3d0:	60a2                	ld	ra,8(sp)
 3d2:	6402                	ld	s0,0(sp)
 3d4:	0141                	addi	sp,sp,16
 3d6:	8082                	ret

00000000000003d8 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 3d8:	4885                	li	a7,1
 ecall
 3da:	00000073          	ecall
 ret
 3de:	8082                	ret

00000000000003e0 <exit>:
.global exit
exit:
 li a7, SYS_exit
 3e0:	4889                	li	a7,2
 ecall
 3e2:	00000073          	ecall
 ret
 3e6:	8082                	ret

00000000000003e8 <wait>:
.global wait
wait:
 li a7, SYS_wait
 3e8:	488d                	li	a7,3
 ecall
 3ea:	00000073          	ecall
 ret
 3ee:	8082                	ret

00000000000003f0 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 3f0:	4891                	li	a7,4
 ecall
 3f2:	00000073          	ecall
 ret
 3f6:	8082                	ret

00000000000003f8 <read>:
.global read
read:
 li a7, SYS_read
 3f8:	4895                	li	a7,5
 ecall
 3fa:	00000073          	ecall
 ret
 3fe:	8082                	ret

0000000000000400 <write>:
.global write
write:
 li a7, SYS_write
 400:	48c1                	li	a7,16
 ecall
 402:	00000073          	ecall
 ret
 406:	8082                	ret

0000000000000408 <close>:
.global close
close:
 li a7, SYS_close
 408:	48d5                	li	a7,21
 ecall
 40a:	00000073          	ecall
 ret
 40e:	8082                	ret

0000000000000410 <kill>:
.global kill
kill:
 li a7, SYS_kill
 410:	4899                	li	a7,6
 ecall
 412:	00000073          	ecall
 ret
 416:	8082                	ret

0000000000000418 <exec>:
.global exec
exec:
 li a7, SYS_exec
 418:	489d                	li	a7,7
 ecall
 41a:	00000073          	ecall
 ret
 41e:	8082                	ret

0000000000000420 <open>:
.global open
open:
 li a7, SYS_open
 420:	48bd                	li	a7,15
 ecall
 422:	00000073          	ecall
 ret
 426:	8082                	ret

0000000000000428 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 428:	48c5                	li	a7,17
 ecall
 42a:	00000073          	ecall
 ret
 42e:	8082                	ret

0000000000000430 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 430:	48c9                	li	a7,18
 ecall
 432:	00000073          	ecall
 ret
 436:	8082                	ret

0000000000000438 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 438:	48a1                	li	a7,8
 ecall
 43a:	00000073          	ecall
 ret
 43e:	8082                	ret

0000000000000440 <link>:
.global link
link:
 li a7, SYS_link
 440:	48cd                	li	a7,19
 ecall
 442:	00000073          	ecall
 ret
 446:	8082                	ret

0000000000000448 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 448:	48d1                	li	a7,20
 ecall
 44a:	00000073          	ecall
 ret
 44e:	8082                	ret

0000000000000450 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 450:	48a5                	li	a7,9
 ecall
 452:	00000073          	ecall
 ret
 456:	8082                	ret

0000000000000458 <dup>:
.global dup
dup:
 li a7, SYS_dup
 458:	48a9                	li	a7,10
 ecall
 45a:	00000073          	ecall
 ret
 45e:	8082                	ret

0000000000000460 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 460:	48ad                	li	a7,11
 ecall
 462:	00000073          	ecall
 ret
 466:	8082                	ret

0000000000000468 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 468:	48b1                	li	a7,12
 ecall
 46a:	00000073          	ecall
 ret
 46e:	8082                	ret

0000000000000470 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 470:	48b5                	li	a7,13
 ecall
 472:	00000073          	ecall
 ret
 476:	8082                	ret

0000000000000478 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 478:	48b9                	li	a7,14
 ecall
 47a:	00000073          	ecall
 ret
 47e:	8082                	ret

0000000000000480 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 480:	1101                	addi	sp,sp,-32
 482:	ec06                	sd	ra,24(sp)
 484:	e822                	sd	s0,16(sp)
 486:	1000                	addi	s0,sp,32
 488:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 48c:	4605                	li	a2,1
 48e:	fef40593          	addi	a1,s0,-17
 492:	00000097          	auipc	ra,0x0
 496:	f6e080e7          	jalr	-146(ra) # 400 <write>
}
 49a:	60e2                	ld	ra,24(sp)
 49c:	6442                	ld	s0,16(sp)
 49e:	6105                	addi	sp,sp,32
 4a0:	8082                	ret

00000000000004a2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4a2:	7139                	addi	sp,sp,-64
 4a4:	fc06                	sd	ra,56(sp)
 4a6:	f822                	sd	s0,48(sp)
 4a8:	f426                	sd	s1,40(sp)
 4aa:	f04a                	sd	s2,32(sp)
 4ac:	ec4e                	sd	s3,24(sp)
 4ae:	0080                	addi	s0,sp,64
 4b0:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4b2:	c299                	beqz	a3,4b8 <printint+0x16>
 4b4:	0805c863          	bltz	a1,544 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4b8:	2581                	sext.w	a1,a1
  neg = 0;
 4ba:	4881                	li	a7,0
 4bc:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 4c0:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 4c2:	2601                	sext.w	a2,a2
 4c4:	00000517          	auipc	a0,0x0
 4c8:	54450513          	addi	a0,a0,1348 # a08 <digits>
 4cc:	883a                	mv	a6,a4
 4ce:	2705                	addiw	a4,a4,1
 4d0:	02c5f7bb          	remuw	a5,a1,a2
 4d4:	1782                	slli	a5,a5,0x20
 4d6:	9381                	srli	a5,a5,0x20
 4d8:	97aa                	add	a5,a5,a0
 4da:	0007c783          	lbu	a5,0(a5)
 4de:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 4e2:	0005879b          	sext.w	a5,a1
 4e6:	02c5d5bb          	divuw	a1,a1,a2
 4ea:	0685                	addi	a3,a3,1
 4ec:	fec7f0e3          	bgeu	a5,a2,4cc <printint+0x2a>
  if(neg)
 4f0:	00088b63          	beqz	a7,506 <printint+0x64>
    buf[i++] = '-';
 4f4:	fd040793          	addi	a5,s0,-48
 4f8:	973e                	add	a4,a4,a5
 4fa:	02d00793          	li	a5,45
 4fe:	fef70823          	sb	a5,-16(a4)
 502:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 506:	02e05863          	blez	a4,536 <printint+0x94>
 50a:	fc040793          	addi	a5,s0,-64
 50e:	00e78933          	add	s2,a5,a4
 512:	fff78993          	addi	s3,a5,-1
 516:	99ba                	add	s3,s3,a4
 518:	377d                	addiw	a4,a4,-1
 51a:	1702                	slli	a4,a4,0x20
 51c:	9301                	srli	a4,a4,0x20
 51e:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 522:	fff94583          	lbu	a1,-1(s2)
 526:	8526                	mv	a0,s1
 528:	00000097          	auipc	ra,0x0
 52c:	f58080e7          	jalr	-168(ra) # 480 <putc>
  while(--i >= 0)
 530:	197d                	addi	s2,s2,-1
 532:	ff3918e3          	bne	s2,s3,522 <printint+0x80>
}
 536:	70e2                	ld	ra,56(sp)
 538:	7442                	ld	s0,48(sp)
 53a:	74a2                	ld	s1,40(sp)
 53c:	7902                	ld	s2,32(sp)
 53e:	69e2                	ld	s3,24(sp)
 540:	6121                	addi	sp,sp,64
 542:	8082                	ret
    x = -xx;
 544:	40b005bb          	negw	a1,a1
    neg = 1;
 548:	4885                	li	a7,1
    x = -xx;
 54a:	bf8d                	j	4bc <printint+0x1a>

000000000000054c <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 54c:	7119                	addi	sp,sp,-128
 54e:	fc86                	sd	ra,120(sp)
 550:	f8a2                	sd	s0,112(sp)
 552:	f4a6                	sd	s1,104(sp)
 554:	f0ca                	sd	s2,96(sp)
 556:	ecce                	sd	s3,88(sp)
 558:	e8d2                	sd	s4,80(sp)
 55a:	e4d6                	sd	s5,72(sp)
 55c:	e0da                	sd	s6,64(sp)
 55e:	fc5e                	sd	s7,56(sp)
 560:	f862                	sd	s8,48(sp)
 562:	f466                	sd	s9,40(sp)
 564:	f06a                	sd	s10,32(sp)
 566:	ec6e                	sd	s11,24(sp)
 568:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 56a:	0005c903          	lbu	s2,0(a1)
 56e:	18090f63          	beqz	s2,70c <vprintf+0x1c0>
 572:	8aaa                	mv	s5,a0
 574:	8b32                	mv	s6,a2
 576:	00158493          	addi	s1,a1,1
  state = 0;
 57a:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 57c:	02500a13          	li	s4,37
      if(c == 'd'){
 580:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 584:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 588:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 58c:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 590:	00000b97          	auipc	s7,0x0
 594:	478b8b93          	addi	s7,s7,1144 # a08 <digits>
 598:	a839                	j	5b6 <vprintf+0x6a>
        putc(fd, c);
 59a:	85ca                	mv	a1,s2
 59c:	8556                	mv	a0,s5
 59e:	00000097          	auipc	ra,0x0
 5a2:	ee2080e7          	jalr	-286(ra) # 480 <putc>
 5a6:	a019                	j	5ac <vprintf+0x60>
    } else if(state == '%'){
 5a8:	01498f63          	beq	s3,s4,5c6 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 5ac:	0485                	addi	s1,s1,1
 5ae:	fff4c903          	lbu	s2,-1(s1)
 5b2:	14090d63          	beqz	s2,70c <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 5b6:	0009079b          	sext.w	a5,s2
    if(state == 0){
 5ba:	fe0997e3          	bnez	s3,5a8 <vprintf+0x5c>
      if(c == '%'){
 5be:	fd479ee3          	bne	a5,s4,59a <vprintf+0x4e>
        state = '%';
 5c2:	89be                	mv	s3,a5
 5c4:	b7e5                	j	5ac <vprintf+0x60>
      if(c == 'd'){
 5c6:	05878063          	beq	a5,s8,606 <vprintf+0xba>
      } else if(c == 'l') {
 5ca:	05978c63          	beq	a5,s9,622 <vprintf+0xd6>
      } else if(c == 'x') {
 5ce:	07a78863          	beq	a5,s10,63e <vprintf+0xf2>
      } else if(c == 'p') {
 5d2:	09b78463          	beq	a5,s11,65a <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 5d6:	07300713          	li	a4,115
 5da:	0ce78663          	beq	a5,a4,6a6 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5de:	06300713          	li	a4,99
 5e2:	0ee78e63          	beq	a5,a4,6de <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 5e6:	11478863          	beq	a5,s4,6f6 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5ea:	85d2                	mv	a1,s4
 5ec:	8556                	mv	a0,s5
 5ee:	00000097          	auipc	ra,0x0
 5f2:	e92080e7          	jalr	-366(ra) # 480 <putc>
        putc(fd, c);
 5f6:	85ca                	mv	a1,s2
 5f8:	8556                	mv	a0,s5
 5fa:	00000097          	auipc	ra,0x0
 5fe:	e86080e7          	jalr	-378(ra) # 480 <putc>
      }
      state = 0;
 602:	4981                	li	s3,0
 604:	b765                	j	5ac <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 606:	008b0913          	addi	s2,s6,8
 60a:	4685                	li	a3,1
 60c:	4629                	li	a2,10
 60e:	000b2583          	lw	a1,0(s6)
 612:	8556                	mv	a0,s5
 614:	00000097          	auipc	ra,0x0
 618:	e8e080e7          	jalr	-370(ra) # 4a2 <printint>
 61c:	8b4a                	mv	s6,s2
      state = 0;
 61e:	4981                	li	s3,0
 620:	b771                	j	5ac <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 622:	008b0913          	addi	s2,s6,8
 626:	4681                	li	a3,0
 628:	4629                	li	a2,10
 62a:	000b2583          	lw	a1,0(s6)
 62e:	8556                	mv	a0,s5
 630:	00000097          	auipc	ra,0x0
 634:	e72080e7          	jalr	-398(ra) # 4a2 <printint>
 638:	8b4a                	mv	s6,s2
      state = 0;
 63a:	4981                	li	s3,0
 63c:	bf85                	j	5ac <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 63e:	008b0913          	addi	s2,s6,8
 642:	4681                	li	a3,0
 644:	4641                	li	a2,16
 646:	000b2583          	lw	a1,0(s6)
 64a:	8556                	mv	a0,s5
 64c:	00000097          	auipc	ra,0x0
 650:	e56080e7          	jalr	-426(ra) # 4a2 <printint>
 654:	8b4a                	mv	s6,s2
      state = 0;
 656:	4981                	li	s3,0
 658:	bf91                	j	5ac <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 65a:	008b0793          	addi	a5,s6,8
 65e:	f8f43423          	sd	a5,-120(s0)
 662:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 666:	03000593          	li	a1,48
 66a:	8556                	mv	a0,s5
 66c:	00000097          	auipc	ra,0x0
 670:	e14080e7          	jalr	-492(ra) # 480 <putc>
  putc(fd, 'x');
 674:	85ea                	mv	a1,s10
 676:	8556                	mv	a0,s5
 678:	00000097          	auipc	ra,0x0
 67c:	e08080e7          	jalr	-504(ra) # 480 <putc>
 680:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 682:	03c9d793          	srli	a5,s3,0x3c
 686:	97de                	add	a5,a5,s7
 688:	0007c583          	lbu	a1,0(a5)
 68c:	8556                	mv	a0,s5
 68e:	00000097          	auipc	ra,0x0
 692:	df2080e7          	jalr	-526(ra) # 480 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 696:	0992                	slli	s3,s3,0x4
 698:	397d                	addiw	s2,s2,-1
 69a:	fe0914e3          	bnez	s2,682 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 69e:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 6a2:	4981                	li	s3,0
 6a4:	b721                	j	5ac <vprintf+0x60>
        s = va_arg(ap, char*);
 6a6:	008b0993          	addi	s3,s6,8
 6aa:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 6ae:	02090163          	beqz	s2,6d0 <vprintf+0x184>
        while(*s != 0){
 6b2:	00094583          	lbu	a1,0(s2)
 6b6:	c9a1                	beqz	a1,706 <vprintf+0x1ba>
          putc(fd, *s);
 6b8:	8556                	mv	a0,s5
 6ba:	00000097          	auipc	ra,0x0
 6be:	dc6080e7          	jalr	-570(ra) # 480 <putc>
          s++;
 6c2:	0905                	addi	s2,s2,1
        while(*s != 0){
 6c4:	00094583          	lbu	a1,0(s2)
 6c8:	f9e5                	bnez	a1,6b8 <vprintf+0x16c>
        s = va_arg(ap, char*);
 6ca:	8b4e                	mv	s6,s3
      state = 0;
 6cc:	4981                	li	s3,0
 6ce:	bdf9                	j	5ac <vprintf+0x60>
          s = "(null)";
 6d0:	00000917          	auipc	s2,0x0
 6d4:	33090913          	addi	s2,s2,816 # a00 <malloc+0x1ea>
        while(*s != 0){
 6d8:	02800593          	li	a1,40
 6dc:	bff1                	j	6b8 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 6de:	008b0913          	addi	s2,s6,8
 6e2:	000b4583          	lbu	a1,0(s6)
 6e6:	8556                	mv	a0,s5
 6e8:	00000097          	auipc	ra,0x0
 6ec:	d98080e7          	jalr	-616(ra) # 480 <putc>
 6f0:	8b4a                	mv	s6,s2
      state = 0;
 6f2:	4981                	li	s3,0
 6f4:	bd65                	j	5ac <vprintf+0x60>
        putc(fd, c);
 6f6:	85d2                	mv	a1,s4
 6f8:	8556                	mv	a0,s5
 6fa:	00000097          	auipc	ra,0x0
 6fe:	d86080e7          	jalr	-634(ra) # 480 <putc>
      state = 0;
 702:	4981                	li	s3,0
 704:	b565                	j	5ac <vprintf+0x60>
        s = va_arg(ap, char*);
 706:	8b4e                	mv	s6,s3
      state = 0;
 708:	4981                	li	s3,0
 70a:	b54d                	j	5ac <vprintf+0x60>
    }
  }
}
 70c:	70e6                	ld	ra,120(sp)
 70e:	7446                	ld	s0,112(sp)
 710:	74a6                	ld	s1,104(sp)
 712:	7906                	ld	s2,96(sp)
 714:	69e6                	ld	s3,88(sp)
 716:	6a46                	ld	s4,80(sp)
 718:	6aa6                	ld	s5,72(sp)
 71a:	6b06                	ld	s6,64(sp)
 71c:	7be2                	ld	s7,56(sp)
 71e:	7c42                	ld	s8,48(sp)
 720:	7ca2                	ld	s9,40(sp)
 722:	7d02                	ld	s10,32(sp)
 724:	6de2                	ld	s11,24(sp)
 726:	6109                	addi	sp,sp,128
 728:	8082                	ret

000000000000072a <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 72a:	715d                	addi	sp,sp,-80
 72c:	ec06                	sd	ra,24(sp)
 72e:	e822                	sd	s0,16(sp)
 730:	1000                	addi	s0,sp,32
 732:	e010                	sd	a2,0(s0)
 734:	e414                	sd	a3,8(s0)
 736:	e818                	sd	a4,16(s0)
 738:	ec1c                	sd	a5,24(s0)
 73a:	03043023          	sd	a6,32(s0)
 73e:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 742:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 746:	8622                	mv	a2,s0
 748:	00000097          	auipc	ra,0x0
 74c:	e04080e7          	jalr	-508(ra) # 54c <vprintf>
}
 750:	60e2                	ld	ra,24(sp)
 752:	6442                	ld	s0,16(sp)
 754:	6161                	addi	sp,sp,80
 756:	8082                	ret

0000000000000758 <printf>:

void
printf(const char *fmt, ...)
{
 758:	711d                	addi	sp,sp,-96
 75a:	ec06                	sd	ra,24(sp)
 75c:	e822                	sd	s0,16(sp)
 75e:	1000                	addi	s0,sp,32
 760:	e40c                	sd	a1,8(s0)
 762:	e810                	sd	a2,16(s0)
 764:	ec14                	sd	a3,24(s0)
 766:	f018                	sd	a4,32(s0)
 768:	f41c                	sd	a5,40(s0)
 76a:	03043823          	sd	a6,48(s0)
 76e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 772:	00840613          	addi	a2,s0,8
 776:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 77a:	85aa                	mv	a1,a0
 77c:	4505                	li	a0,1
 77e:	00000097          	auipc	ra,0x0
 782:	dce080e7          	jalr	-562(ra) # 54c <vprintf>
}
 786:	60e2                	ld	ra,24(sp)
 788:	6442                	ld	s0,16(sp)
 78a:	6125                	addi	sp,sp,96
 78c:	8082                	ret

000000000000078e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 78e:	1141                	addi	sp,sp,-16
 790:	e422                	sd	s0,8(sp)
 792:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 794:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 798:	00000797          	auipc	a5,0x0
 79c:	2887b783          	ld	a5,648(a5) # a20 <freep>
 7a0:	a805                	j	7d0 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7a2:	4618                	lw	a4,8(a2)
 7a4:	9db9                	addw	a1,a1,a4
 7a6:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 7aa:	6398                	ld	a4,0(a5)
 7ac:	6318                	ld	a4,0(a4)
 7ae:	fee53823          	sd	a4,-16(a0)
 7b2:	a091                	j	7f6 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7b4:	ff852703          	lw	a4,-8(a0)
 7b8:	9e39                	addw	a2,a2,a4
 7ba:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 7bc:	ff053703          	ld	a4,-16(a0)
 7c0:	e398                	sd	a4,0(a5)
 7c2:	a099                	j	808 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c4:	6398                	ld	a4,0(a5)
 7c6:	00e7e463          	bltu	a5,a4,7ce <free+0x40>
 7ca:	00e6ea63          	bltu	a3,a4,7de <free+0x50>
{
 7ce:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d0:	fed7fae3          	bgeu	a5,a3,7c4 <free+0x36>
 7d4:	6398                	ld	a4,0(a5)
 7d6:	00e6e463          	bltu	a3,a4,7de <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7da:	fee7eae3          	bltu	a5,a4,7ce <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 7de:	ff852583          	lw	a1,-8(a0)
 7e2:	6390                	ld	a2,0(a5)
 7e4:	02059713          	slli	a4,a1,0x20
 7e8:	9301                	srli	a4,a4,0x20
 7ea:	0712                	slli	a4,a4,0x4
 7ec:	9736                	add	a4,a4,a3
 7ee:	fae60ae3          	beq	a2,a4,7a2 <free+0x14>
    bp->s.ptr = p->s.ptr;
 7f2:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 7f6:	4790                	lw	a2,8(a5)
 7f8:	02061713          	slli	a4,a2,0x20
 7fc:	9301                	srli	a4,a4,0x20
 7fe:	0712                	slli	a4,a4,0x4
 800:	973e                	add	a4,a4,a5
 802:	fae689e3          	beq	a3,a4,7b4 <free+0x26>
  } else
    p->s.ptr = bp;
 806:	e394                	sd	a3,0(a5)
  freep = p;
 808:	00000717          	auipc	a4,0x0
 80c:	20f73c23          	sd	a5,536(a4) # a20 <freep>
}
 810:	6422                	ld	s0,8(sp)
 812:	0141                	addi	sp,sp,16
 814:	8082                	ret

0000000000000816 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 816:	7139                	addi	sp,sp,-64
 818:	fc06                	sd	ra,56(sp)
 81a:	f822                	sd	s0,48(sp)
 81c:	f426                	sd	s1,40(sp)
 81e:	f04a                	sd	s2,32(sp)
 820:	ec4e                	sd	s3,24(sp)
 822:	e852                	sd	s4,16(sp)
 824:	e456                	sd	s5,8(sp)
 826:	e05a                	sd	s6,0(sp)
 828:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 82a:	02051493          	slli	s1,a0,0x20
 82e:	9081                	srli	s1,s1,0x20
 830:	04bd                	addi	s1,s1,15
 832:	8091                	srli	s1,s1,0x4
 834:	0014899b          	addiw	s3,s1,1
 838:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 83a:	00000517          	auipc	a0,0x0
 83e:	1e653503          	ld	a0,486(a0) # a20 <freep>
 842:	c515                	beqz	a0,86e <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 844:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 846:	4798                	lw	a4,8(a5)
 848:	02977f63          	bgeu	a4,s1,886 <malloc+0x70>
 84c:	8a4e                	mv	s4,s3
 84e:	0009871b          	sext.w	a4,s3
 852:	6685                	lui	a3,0x1
 854:	00d77363          	bgeu	a4,a3,85a <malloc+0x44>
 858:	6a05                	lui	s4,0x1
 85a:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 85e:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 862:	00000917          	auipc	s2,0x0
 866:	1be90913          	addi	s2,s2,446 # a20 <freep>
  if(p == (char*)-1)
 86a:	5afd                	li	s5,-1
 86c:	a88d                	j	8de <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 86e:	00000797          	auipc	a5,0x0
 872:	1ba78793          	addi	a5,a5,442 # a28 <base>
 876:	00000717          	auipc	a4,0x0
 87a:	1af73523          	sd	a5,426(a4) # a20 <freep>
 87e:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 880:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 884:	b7e1                	j	84c <malloc+0x36>
      if(p->s.size == nunits)
 886:	02e48b63          	beq	s1,a4,8bc <malloc+0xa6>
        p->s.size -= nunits;
 88a:	4137073b          	subw	a4,a4,s3
 88e:	c798                	sw	a4,8(a5)
        p += p->s.size;
 890:	1702                	slli	a4,a4,0x20
 892:	9301                	srli	a4,a4,0x20
 894:	0712                	slli	a4,a4,0x4
 896:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 898:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 89c:	00000717          	auipc	a4,0x0
 8a0:	18a73223          	sd	a0,388(a4) # a20 <freep>
      return (void*)(p + 1);
 8a4:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8a8:	70e2                	ld	ra,56(sp)
 8aa:	7442                	ld	s0,48(sp)
 8ac:	74a2                	ld	s1,40(sp)
 8ae:	7902                	ld	s2,32(sp)
 8b0:	69e2                	ld	s3,24(sp)
 8b2:	6a42                	ld	s4,16(sp)
 8b4:	6aa2                	ld	s5,8(sp)
 8b6:	6b02                	ld	s6,0(sp)
 8b8:	6121                	addi	sp,sp,64
 8ba:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 8bc:	6398                	ld	a4,0(a5)
 8be:	e118                	sd	a4,0(a0)
 8c0:	bff1                	j	89c <malloc+0x86>
  hp->s.size = nu;
 8c2:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 8c6:	0541                	addi	a0,a0,16
 8c8:	00000097          	auipc	ra,0x0
 8cc:	ec6080e7          	jalr	-314(ra) # 78e <free>
  return freep;
 8d0:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 8d4:	d971                	beqz	a0,8a8 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d6:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8d8:	4798                	lw	a4,8(a5)
 8da:	fa9776e3          	bgeu	a4,s1,886 <malloc+0x70>
    if(p == freep)
 8de:	00093703          	ld	a4,0(s2)
 8e2:	853e                	mv	a0,a5
 8e4:	fef719e3          	bne	a4,a5,8d6 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 8e8:	8552                	mv	a0,s4
 8ea:	00000097          	auipc	ra,0x0
 8ee:	b7e080e7          	jalr	-1154(ra) # 468 <sbrk>
  if(p == (char*)-1)
 8f2:	fd5518e3          	bne	a0,s5,8c2 <malloc+0xac>
        return 0;
 8f6:	4501                	li	a0,0
 8f8:	bf45                	j	8a8 <malloc+0x92>
