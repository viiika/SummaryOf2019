
uMain.elf:     file format elf32-i386


Disassembly of section .text:

00000000 <ping_thread_function>:
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	53                   	push   %ebx
       4:	83 ec 14             	sub    $0x14,%esp
       7:	e8 9b 01 00 00       	call   1a7 <__x86.get_pc_thunk.bx>
       c:	81 c3 f4 2f 00 00    	add    $0x2ff4,%ebx
      12:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
      19:	eb 41                	jmp    5c <ping_thread_function+0x5c>
      1b:	8b 83 20 00 00 00    	mov    0x20(%ebx),%eax
      21:	40                   	inc    %eax
      22:	89 83 20 00 00 00    	mov    %eax,0x20(%ebx)
      28:	8b 45 08             	mov    0x8(%ebp),%eax
      2b:	8b 10                	mov    (%eax),%edx
      2d:	8b 83 20 00 00 00    	mov    0x20(%ebx),%eax
      33:	83 ec 04             	sub    $0x4,%esp
      36:	52                   	push   %edx
      37:	50                   	push   %eax
      38:	8d 83 51 e4 ff ff    	lea    -0x1baf(%ebx),%eax
      3e:	50                   	push   %eax
      3f:	e8 17 0e 00 00       	call   e5b <printf>
      44:	83 c4 10             	add    $0x10,%esp
      47:	83 ec 0c             	sub    $0xc,%esp
      4a:	6a 0a                	push   $0xa
      4c:	e8 b9 13 00 00       	call   140a <sleep>
      51:	83 c4 10             	add    $0x10,%esp
      54:	e8 a5 0c 00 00       	call   cfe <pthread_yield>
      59:	ff 45 f4             	incl   -0xc(%ebp)
      5c:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
      60:	7e b9                	jle    1b <ping_thread_function+0x1b>
      62:	83 ec 0c             	sub    $0xc,%esp
      65:	6a 00                	push   $0x0
      67:	e8 63 09 00 00       	call   9cf <pthread_exit>
      6c:	83 c4 10             	add    $0x10,%esp
      6f:	b8 00 00 00 00       	mov    $0x0,%eax
      74:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      77:	c9                   	leave  
      78:	c3                   	ret    

00000079 <pong_thread_function>:
      79:	55                   	push   %ebp
      7a:	89 e5                	mov    %esp,%ebp
      7c:	53                   	push   %ebx
      7d:	83 ec 14             	sub    $0x14,%esp
      80:	e8 22 01 00 00       	call   1a7 <__x86.get_pc_thunk.bx>
      85:	81 c3 7b 2f 00 00    	add    $0x2f7b,%ebx
      8b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
      92:	eb 3b                	jmp    cf <pong_thread_function+0x56>
      94:	8b 83 20 00 00 00    	mov    0x20(%ebx),%eax
      9a:	40                   	inc    %eax
      9b:	89 83 20 00 00 00    	mov    %eax,0x20(%ebx)
      a1:	8b 83 20 00 00 00    	mov    0x20(%ebx),%eax
      a7:	83 ec 08             	sub    $0x8,%esp
      aa:	50                   	push   %eax
      ab:	8d 83 5d e4 ff ff    	lea    -0x1ba3(%ebx),%eax
      b1:	50                   	push   %eax
      b2:	e8 a4 0d 00 00       	call   e5b <printf>
      b7:	83 c4 10             	add    $0x10,%esp
      ba:	83 ec 0c             	sub    $0xc,%esp
      bd:	6a 0a                	push   $0xa
      bf:	e8 46 13 00 00       	call   140a <sleep>
      c4:	83 c4 10             	add    $0x10,%esp
      c7:	e8 32 0c 00 00       	call   cfe <pthread_yield>
      cc:	ff 45 f4             	incl   -0xc(%ebp)
      cf:	83 7d f4 04          	cmpl   $0x4,-0xc(%ebp)
      d3:	7e bf                	jle    94 <pong_thread_function+0x1b>
      d5:	83 ec 0c             	sub    $0xc,%esp
      d8:	6a 00                	push   $0x0
      da:	e8 f0 08 00 00       	call   9cf <pthread_exit>
      df:	83 c4 10             	add    $0x10,%esp
      e2:	b8 00 00 00 00       	mov    $0x0,%eax
      e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      ea:	c9                   	leave  
      eb:	c3                   	ret    

000000ec <main>:
      ec:	8d 4c 24 04          	lea    0x4(%esp),%ecx
      f0:	83 e4 f0             	and    $0xfffffff0,%esp
      f3:	ff 71 fc             	pushl  -0x4(%ecx)
      f6:	55                   	push   %ebp
      f7:	89 e5                	mov    %esp,%ebp
      f9:	53                   	push   %ebx
      fa:	51                   	push   %ecx
      fb:	83 ec 20             	sub    $0x20,%esp
      fe:	e8 a4 00 00 00       	call   1a7 <__x86.get_pc_thunk.bx>
     103:	81 c3 fd 2e 00 00    	add    $0x2efd,%ebx
     109:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
     110:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
     117:	8d 45 f4             	lea    -0xc(%ebp),%eax
     11a:	50                   	push   %eax
     11b:	8d 83 00 d0 ff ff    	lea    -0x3000(%ebx),%eax
     121:	50                   	push   %eax
     122:	6a 00                	push   $0x0
     124:	8d 45 ec             	lea    -0x14(%ebp),%eax
     127:	50                   	push   %eax
     128:	e8 8d 05 00 00       	call   6ba <pthread_create>
     12d:	83 c4 10             	add    $0x10,%esp
     130:	8d 45 f0             	lea    -0x10(%ebp),%eax
     133:	50                   	push   %eax
     134:	8d 83 00 d0 ff ff    	lea    -0x3000(%ebx),%eax
     13a:	50                   	push   %eax
     13b:	6a 00                	push   $0x0
     13d:	8d 45 e8             	lea    -0x18(%ebp),%eax
     140:	50                   	push   %eax
     141:	e8 74 05 00 00       	call   6ba <pthread_create>
     146:	83 c4 10             	add    $0x10,%esp
     149:	6a 00                	push   $0x0
     14b:	8d 83 79 d0 ff ff    	lea    -0x2f87(%ebx),%eax
     151:	50                   	push   %eax
     152:	6a 00                	push   $0x0
     154:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     157:	50                   	push   %eax
     158:	e8 5d 05 00 00       	call   6ba <pthread_create>
     15d:	83 c4 10             	add    $0x10,%esp
     160:	8b 45 ec             	mov    -0x14(%ebp),%eax
     163:	83 ec 08             	sub    $0x8,%esp
     166:	6a 00                	push   $0x0
     168:	50                   	push   %eax
     169:	e8 8e 09 00 00       	call   afc <pthread_join>
     16e:	83 c4 10             	add    $0x10,%esp
     171:	8b 45 e8             	mov    -0x18(%ebp),%eax
     174:	83 ec 08             	sub    $0x8,%esp
     177:	6a 00                	push   $0x0
     179:	50                   	push   %eax
     17a:	e8 7d 09 00 00       	call   afc <pthread_join>
     17f:	83 c4 10             	add    $0x10,%esp
     182:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     185:	83 ec 08             	sub    $0x8,%esp
     188:	6a 00                	push   $0x0
     18a:	50                   	push   %eax
     18b:	e8 6c 09 00 00       	call   afc <pthread_join>
     190:	83 c4 10             	add    $0x10,%esp
     193:	e8 96 12 00 00       	call   142e <exit>
     198:	b8 00 00 00 00       	mov    $0x0,%eax
     19d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     1a0:	59                   	pop    %ecx
     1a1:	5b                   	pop    %ebx
     1a2:	5d                   	pop    %ebp
     1a3:	8d 61 fc             	lea    -0x4(%ecx),%esp
     1a6:	c3                   	ret    

000001a7 <__x86.get_pc_thunk.bx>:
     1a7:	8b 1c 24             	mov    (%esp),%ebx
     1aa:	c3                   	ret    

000001ab <uEntry>:
     1ab:	55                   	push   %ebp
     1ac:	89 e5                	mov    %esp,%ebp
     1ae:	53                   	push   %ebx
     1af:	83 ec 14             	sub    $0x14,%esp
     1b2:	e8 f0 ff ff ff       	call   1a7 <__x86.get_pc_thunk.bx>
     1b7:	81 c3 49 2e 00 00    	add    $0x2e49,%ebx
     1bd:	e8 00 12 00 00       	call   13c2 <fork>
     1c2:	89 45 f0             	mov    %eax,-0x10(%ebp)
     1c5:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
     1cc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     1d0:	75 48                	jne    21a <uEntry+0x6f>
     1d2:	c7 83 24 00 00 00 02 	movl   $0x2,0x24(%ebx)
     1d9:	00 00 00 
     1dc:	eb 2f                	jmp    20d <uEntry+0x62>
     1de:	ff 4d f4             	decl   -0xc(%ebp)
     1e1:	8b 83 24 00 00 00    	mov    0x24(%ebx),%eax
     1e7:	83 ec 04             	sub    $0x4,%esp
     1ea:	ff 75 f4             	pushl  -0xc(%ebp)
     1ed:	50                   	push   %eax
     1ee:	8d 83 66 e4 ff ff    	lea    -0x1b9a(%ebx),%eax
     1f4:	50                   	push   %eax
     1f5:	e8 61 0c 00 00       	call   e5b <printf>
     1fa:	83 c4 10             	add    $0x10,%esp
     1fd:	83 ec 0c             	sub    $0xc,%esp
     200:	68 80 00 00 00       	push   $0x80
     205:	e8 00 12 00 00       	call   140a <sleep>
     20a:	83 c4 10             	add    $0x10,%esp
     20d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     211:	75 cb                	jne    1de <uEntry+0x33>
     213:	e8 16 12 00 00       	call   142e <exit>
     218:	eb 10                	jmp    22a <uEntry+0x7f>
     21a:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
     21e:	74 0a                	je     22a <uEntry+0x7f>
     220:	e8 0f 00 00 00       	call   234 <pthread_initial>
     225:	e8 c2 fe ff ff       	call   ec <main>
     22a:	b8 00 00 00 00       	mov    $0x0,%eax
     22f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     232:	c9                   	leave  
     233:	c3                   	ret    

00000234 <pthread_initial>:
     234:	55                   	push   %ebp
     235:	89 e5                	mov    %esp,%ebp
     237:	56                   	push   %esi
     238:	53                   	push   %ebx
     239:	83 ec 10             	sub    $0x10,%esp
     23c:	e8 bf 0b 00 00       	call   e00 <__x86.get_pc_thunk.dx>
     241:	81 c2 bf 2d 00 00    	add    $0x2dbf,%edx
     247:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     24e:	eb 7d                	jmp    2cd <pthread_initial+0x99>
     250:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     256:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     259:	89 d8                	mov    %ebx,%eax
     25b:	c1 e0 02             	shl    $0x2,%eax
     25e:	01 d8                	add    %ebx,%eax
     260:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
     267:	01 c8                	add    %ecx,%eax
     269:	89 c1                	mov    %eax,%ecx
     26b:	c1 e1 05             	shl    $0x5,%ecx
     26e:	29 c1                	sub    %eax,%ecx
     270:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
     273:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
     276:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
     27d:	89 c1                	mov    %eax,%ecx
     27f:	8d 04 0e             	lea    (%esi,%ecx,1),%eax
     282:	05 30 18 00 00       	add    $0x1830,%eax
     287:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
     28d:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     293:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     296:	89 d8                	mov    %ebx,%eax
     298:	c1 e0 02             	shl    $0x2,%eax
     29b:	01 d8                	add    %ebx,%eax
     29d:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
     2a4:	01 c8                	add    %ecx,%eax
     2a6:	89 c1                	mov    %eax,%ecx
     2a8:	c1 e1 05             	shl    $0x5,%ecx
     2ab:	29 c1                	sub    %eax,%ecx
     2ad:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
     2b0:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
     2b3:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
     2ba:	89 c1                	mov    %eax,%ecx
     2bc:	8d 04 0e             	lea    (%esi,%ecx,1),%eax
     2bf:	05 38 18 00 00       	add    $0x1838,%eax
     2c4:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     2ca:	ff 45 f4             	incl   -0xc(%ebp)
     2cd:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
     2d1:	0f 8e 79 ff ff ff    	jle    250 <pthread_initial+0x1c>
     2d7:	c7 c0 40 30 00 00    	mov    $0x3040,%eax
     2dd:	c7 80 30 18 00 00 01 	movl   $0x1,0x1830(%eax)
     2e4:	00 00 00 
     2e7:	c7 c0 40 30 00 00    	mov    $0x3040,%eax
     2ed:	c7 80 34 18 00 00 00 	movl   $0x0,0x1834(%eax)
     2f4:	00 00 00 
     2f7:	c7 c0 30 91 00 00    	mov    $0x9130,%eax
     2fd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
     303:	90                   	nop
     304:	83 c4 10             	add    $0x10,%esp
     307:	5b                   	pop    %ebx
     308:	5e                   	pop    %esi
     309:	5d                   	pop    %ebp
     30a:	c3                   	ret    

0000030b <creatediaoyong>:
     30b:	55                   	push   %ebp
     30c:	89 e5                	mov    %esp,%ebp
     30e:	57                   	push   %edi
     30f:	56                   	push   %esi
     310:	53                   	push   %ebx
     311:	83 ec 0c             	sub    $0xc,%esp
     314:	e8 8e fe ff ff       	call   1a7 <__x86.get_pc_thunk.bx>
     319:	81 c3 e7 2c 00 00    	add    $0x2ce7,%ebx
     31f:	c7 c0 30 91 00 00    	mov    $0x9130,%eax
     325:	8b 08                	mov    (%eax),%ecx
     327:	8b 75 04             	mov    0x4(%ebp),%esi
     32a:	c7 c7 40 30 00 00    	mov    $0x3040,%edi
     330:	89 c8                	mov    %ecx,%eax
     332:	c1 e0 02             	shl    $0x2,%eax
     335:	01 c8                	add    %ecx,%eax
     337:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     33e:	01 d0                	add    %edx,%eax
     340:	89 c2                	mov    %eax,%edx
     342:	c1 e2 05             	shl    $0x5,%edx
     345:	29 c2                	sub    %eax,%edx
     347:	8d 04 12             	lea    (%edx,%edx,1),%eax
     34a:	8d 14 08             	lea    (%eax,%ecx,1),%edx
     34d:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
     354:	89 c2                	mov    %eax,%edx
     356:	8d 04 17             	lea    (%edi,%edx,1),%eax
     359:	05 20 18 00 00       	add    $0x1820,%eax
     35e:	89 30                	mov    %esi,(%eax)
     360:	c7 c0 30 91 00 00    	mov    $0x9130,%eax
     366:	8b 08                	mov    (%eax),%ecx
     368:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     36e:	89 c8                	mov    %ecx,%eax
     370:	c1 e0 02             	shl    $0x2,%eax
     373:	01 c8                	add    %ecx,%eax
     375:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     37c:	01 d0                	add    %edx,%eax
     37e:	89 c2                	mov    %eax,%edx
     380:	c1 e2 05             	shl    $0x5,%edx
     383:	29 c2                	sub    %eax,%edx
     385:	8d 04 12             	lea    (%edx,%edx,1),%eax
     388:	8d 14 08             	lea    (%eax,%ecx,1),%edx
     38b:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
     392:	89 c2                	mov    %eax,%edx
     394:	8d 04 16             	lea    (%esi,%edx,1),%eax
     397:	05 20 18 00 00       	add    $0x1820,%eax
     39c:	8b 00                	mov    (%eax),%eax
     39e:	83 ec 08             	sub    $0x8,%esp
     3a1:	50                   	push   %eax
     3a2:	8d 83 7e e4 ff ff    	lea    -0x1b82(%ebx),%eax
     3a8:	50                   	push   %eax
     3a9:	e8 ad 0a 00 00       	call   e5b <printf>
     3ae:	83 c4 10             	add    $0x10,%esp
     3b1:	c7 c0 30 91 00 00    	mov    $0x9130,%eax
     3b7:	8b 55 08             	mov    0x8(%ebp),%edx
     3ba:	89 10                	mov    %edx,(%eax)
     3bc:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     3c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
     3c5:	89 c8                	mov    %ecx,%eax
     3c7:	c1 e0 02             	shl    $0x2,%eax
     3ca:	01 c8                	add    %ecx,%eax
     3cc:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     3d3:	01 d0                	add    %edx,%eax
     3d5:	89 c2                	mov    %eax,%edx
     3d7:	c1 e2 05             	shl    $0x5,%edx
     3da:	29 c2                	sub    %eax,%edx
     3dc:	8d 04 12             	lea    (%edx,%edx,1),%eax
     3df:	8d 14 08             	lea    (%eax,%ecx,1),%edx
     3e2:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
     3e9:	89 c2                	mov    %eax,%edx
     3eb:	8d 04 16             	lea    (%esi,%edx,1),%eax
     3ee:	05 0c 18 00 00       	add    $0x180c,%eax
     3f3:	8b 20                	mov    (%eax),%esp
     3f5:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     3fb:	8b 4d 08             	mov    0x8(%ebp),%ecx
     3fe:	89 c8                	mov    %ecx,%eax
     400:	c1 e0 02             	shl    $0x2,%eax
     403:	01 c8                	add    %ecx,%eax
     405:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     40c:	01 d0                	add    %edx,%eax
     40e:	89 c2                	mov    %eax,%edx
     410:	c1 e2 05             	shl    $0x5,%edx
     413:	29 c2                	sub    %eax,%edx
     415:	8d 04 12             	lea    (%edx,%edx,1),%eax
     418:	8d 14 08             	lea    (%eax,%ecx,1),%edx
     41b:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
     422:	89 c2                	mov    %eax,%edx
     424:	8d 04 16             	lea    (%esi,%edx,1),%eax
     427:	05 08 18 00 00       	add    $0x1808,%eax
     42c:	8b 28                	mov    (%eax),%ebp
     42e:	c7 c3 40 30 00 00    	mov    $0x3040,%ebx
     434:	8b 4d 08             	mov    0x8(%ebp),%ecx
     437:	89 c8                	mov    %ecx,%eax
     439:	c1 e0 02             	shl    $0x2,%eax
     43c:	01 c8                	add    %ecx,%eax
     43e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     445:	01 d0                	add    %edx,%eax
     447:	89 c2                	mov    %eax,%edx
     449:	c1 e2 05             	shl    $0x5,%edx
     44c:	29 c2                	sub    %eax,%edx
     44e:	8d 04 12             	lea    (%edx,%edx,1),%eax
     451:	8d 14 08             	lea    (%eax,%ecx,1),%edx
     454:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
     45b:	89 c2                	mov    %eax,%edx
     45d:	8d 04 13             	lea    (%ebx,%edx,1),%eax
     460:	05 20 18 00 00       	add    $0x1820,%eax
     465:	8b 00                	mov    (%eax),%eax
     467:	ff e0                	jmp    *%eax
     469:	90                   	nop
     46a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     46d:	5b                   	pop    %ebx
     46e:	5e                   	pop    %esi
     46f:	5f                   	pop    %edi
     470:	5d                   	pop    %ebp
     471:	c3                   	ret    

00000472 <diaoyong>:
     472:	55                   	push   %ebp
     473:	89 e5                	mov    %esp,%ebp
     475:	57                   	push   %edi
     476:	56                   	push   %esi
     477:	53                   	push   %ebx
     478:	83 ec 10             	sub    $0x10,%esp
     47b:	e8 7c 09 00 00       	call   dfc <__x86.get_pc_thunk.ax>
     480:	05 80 2b 00 00       	add    $0x2b80,%eax
     485:	c7 c2 30 91 00 00    	mov    $0x9130,%edx
     48b:	8b 1a                	mov    (%edx),%ebx
     48d:	8b 75 04             	mov    0x4(%ebp),%esi
     490:	c7 c7 40 30 00 00    	mov    $0x3040,%edi
     496:	89 da                	mov    %ebx,%edx
     498:	c1 e2 02             	shl    $0x2,%edx
     49b:	01 da                	add    %ebx,%edx
     49d:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
     4a4:	01 ca                	add    %ecx,%edx
     4a6:	89 d1                	mov    %edx,%ecx
     4a8:	c1 e1 05             	shl    $0x5,%ecx
     4ab:	29 d1                	sub    %edx,%ecx
     4ad:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
     4b0:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
     4b3:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
     4ba:	89 d1                	mov    %edx,%ecx
     4bc:	8d 14 0f             	lea    (%edi,%ecx,1),%edx
     4bf:	81 c2 20 18 00 00    	add    $0x1820,%edx
     4c5:	89 32                	mov    %esi,(%edx)
     4c7:	c7 c2 30 91 00 00    	mov    $0x9130,%edx
     4cd:	8b 12                	mov    (%edx),%edx
     4cf:	42                   	inc    %edx
     4d0:	81 e2 03 00 00 80    	and    $0x80000003,%edx
     4d6:	85 d2                	test   %edx,%edx
     4d8:	79 05                	jns    4df <diaoyong+0x6d>
     4da:	4a                   	dec    %edx
     4db:	83 ca fc             	or     $0xfffffffc,%edx
     4de:	42                   	inc    %edx
     4df:	89 55 f0             	mov    %edx,-0x10(%ebp)
     4e2:	e9 be 00 00 00       	jmp    5a5 <diaoyong+0x133>
     4e7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     4ee:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
     4f5:	eb 4b                	jmp    542 <diaoyong+0xd0>
     4f7:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     4fd:	8b 5d e8             	mov    -0x18(%ebp),%ebx
     500:	89 da                	mov    %ebx,%edx
     502:	c1 e2 02             	shl    $0x2,%edx
     505:	01 da                	add    %ebx,%edx
     507:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
     50e:	01 ca                	add    %ecx,%edx
     510:	89 d1                	mov    %edx,%ecx
     512:	c1 e1 05             	shl    $0x5,%ecx
     515:	29 d1                	sub    %edx,%ecx
     517:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
     51a:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
     51d:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
     524:	89 d1                	mov    %edx,%ecx
     526:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
     529:	81 c2 38 18 00 00    	add    $0x1838,%edx
     52f:	8b 0a                	mov    (%edx),%ecx
     531:	8b 55 f0             	mov    -0x10(%ebp),%edx
     534:	39 d1                	cmp    %edx,%ecx
     536:	75 07                	jne    53f <diaoyong+0xcd>
     538:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
     53f:	ff 45 e8             	incl   -0x18(%ebp)
     542:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
     546:	7e af                	jle    4f7 <diaoyong+0x85>
     548:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
     54c:	74 40                	je     58e <diaoyong+0x11c>
     54e:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     554:	8b 5d f0             	mov    -0x10(%ebp),%ebx
     557:	89 da                	mov    %ebx,%edx
     559:	c1 e2 02             	shl    $0x2,%edx
     55c:	01 da                	add    %ebx,%edx
     55e:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
     565:	01 ca                	add    %ecx,%edx
     567:	89 d1                	mov    %edx,%ecx
     569:	c1 e1 05             	shl    $0x5,%ecx
     56c:	29 d1                	sub    %edx,%ecx
     56e:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
     571:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
     574:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
     57b:	89 d1                	mov    %edx,%ecx
     57d:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
     580:	81 c2 30 18 00 00    	add    $0x1830,%edx
     586:	8b 12                	mov    (%edx),%edx
     588:	85 d2                	test   %edx,%edx
     58a:	74 2c                	je     5b8 <diaoyong+0x146>
     58c:	eb 01                	jmp    58f <diaoyong+0x11d>
     58e:	90                   	nop
     58f:	8b 55 f0             	mov    -0x10(%ebp),%edx
     592:	42                   	inc    %edx
     593:	81 e2 03 00 00 80    	and    $0x80000003,%edx
     599:	85 d2                	test   %edx,%edx
     59b:	79 05                	jns    5a2 <diaoyong+0x130>
     59d:	4a                   	dec    %edx
     59e:	83 ca fc             	or     $0xfffffffc,%edx
     5a1:	42                   	inc    %edx
     5a2:	89 55 f0             	mov    %edx,-0x10(%ebp)
     5a5:	c7 c2 30 91 00 00    	mov    $0x9130,%edx
     5ab:	8b 12                	mov    (%edx),%edx
     5ad:	39 55 f0             	cmp    %edx,-0x10(%ebp)
     5b0:	0f 85 31 ff ff ff    	jne    4e7 <diaoyong+0x75>
     5b6:	eb 01                	jmp    5b9 <diaoyong+0x147>
     5b8:	90                   	nop
     5b9:	c7 c2 30 91 00 00    	mov    $0x9130,%edx
     5bf:	8b 4d f0             	mov    -0x10(%ebp),%ecx
     5c2:	89 0a                	mov    %ecx,(%edx)
     5c4:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     5ca:	8b 5d f0             	mov    -0x10(%ebp),%ebx
     5cd:	89 da                	mov    %ebx,%edx
     5cf:	c1 e2 02             	shl    $0x2,%edx
     5d2:	01 da                	add    %ebx,%edx
     5d4:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
     5db:	01 ca                	add    %ecx,%edx
     5dd:	89 d1                	mov    %edx,%ecx
     5df:	c1 e1 05             	shl    $0x5,%ecx
     5e2:	29 d1                	sub    %edx,%ecx
     5e4:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
     5e7:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
     5ea:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
     5f1:	89 d1                	mov    %edx,%ecx
     5f3:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
     5f6:	81 c2 30 18 00 00    	add    $0x1830,%edx
     5fc:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     602:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     608:	8b 5d f0             	mov    -0x10(%ebp),%ebx
     60b:	89 da                	mov    %ebx,%edx
     60d:	c1 e2 02             	shl    $0x2,%edx
     610:	01 da                	add    %ebx,%edx
     612:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
     619:	01 ca                	add    %ecx,%edx
     61b:	89 d1                	mov    %edx,%ecx
     61d:	c1 e1 05             	shl    $0x5,%ecx
     620:	29 d1                	sub    %edx,%ecx
     622:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
     625:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
     628:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
     62f:	89 d1                	mov    %edx,%ecx
     631:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
     634:	81 c2 0c 18 00 00    	add    $0x180c,%edx
     63a:	8b 22                	mov    (%edx),%esp
     63c:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     642:	8b 5d f0             	mov    -0x10(%ebp),%ebx
     645:	89 da                	mov    %ebx,%edx
     647:	c1 e2 02             	shl    $0x2,%edx
     64a:	01 da                	add    %ebx,%edx
     64c:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
     653:	01 ca                	add    %ecx,%edx
     655:	89 d1                	mov    %edx,%ecx
     657:	c1 e1 05             	shl    $0x5,%ecx
     65a:	29 d1                	sub    %edx,%ecx
     65c:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
     65f:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
     662:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
     669:	89 d1                	mov    %edx,%ecx
     66b:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
     66e:	81 c2 08 18 00 00    	add    $0x1808,%edx
     674:	8b 2a                	mov    (%edx),%ebp
     676:	c7 c3 40 30 00 00    	mov    $0x3040,%ebx
     67c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
     67f:	89 c8                	mov    %ecx,%eax
     681:	c1 e0 02             	shl    $0x2,%eax
     684:	01 c8                	add    %ecx,%eax
     686:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     68d:	01 d0                	add    %edx,%eax
     68f:	89 c2                	mov    %eax,%edx
     691:	c1 e2 05             	shl    $0x5,%edx
     694:	29 c2                	sub    %eax,%edx
     696:	8d 04 12             	lea    (%edx,%edx,1),%eax
     699:	8d 14 08             	lea    (%eax,%ecx,1),%edx
     69c:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
     6a3:	89 c2                	mov    %eax,%edx
     6a5:	8d 04 13             	lea    (%ebx,%edx,1),%eax
     6a8:	05 20 18 00 00       	add    $0x1820,%eax
     6ad:	8b 00                	mov    (%eax),%eax
     6af:	ff e0                	jmp    *%eax
     6b1:	90                   	nop
     6b2:	83 c4 10             	add    $0x10,%esp
     6b5:	5b                   	pop    %ebx
     6b6:	5e                   	pop    %esi
     6b7:	5f                   	pop    %edi
     6b8:	5d                   	pop    %ebp
     6b9:	c3                   	ret    

000006ba <pthread_create>:
     6ba:	55                   	push   %ebp
     6bb:	89 e5                	mov    %esp,%ebp
     6bd:	57                   	push   %edi
     6be:	56                   	push   %esi
     6bf:	53                   	push   %ebx
     6c0:	83 ec 1c             	sub    $0x1c,%esp
     6c3:	e8 df fa ff ff       	call   1a7 <__x86.get_pc_thunk.bx>
     6c8:	81 c3 38 29 00 00    	add    $0x2938,%ebx
     6ce:	c7 c0 30 91 00 00    	mov    $0x9130,%eax
     6d4:	8b 08                	mov    (%eax),%ecx
     6d6:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     6dc:	89 c8                	mov    %ecx,%eax
     6de:	c1 e0 02             	shl    $0x2,%eax
     6e1:	01 c8                	add    %ecx,%eax
     6e3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     6ea:	01 d0                	add    %edx,%eax
     6ec:	89 c2                	mov    %eax,%edx
     6ee:	c1 e2 05             	shl    $0x5,%edx
     6f1:	29 c2                	sub    %eax,%edx
     6f3:	8d 04 12             	lea    (%edx,%edx,1),%eax
     6f6:	8d 14 08             	lea    (%eax,%ecx,1),%edx
     6f9:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
     700:	89 c2                	mov    %eax,%edx
     702:	8d 04 16             	lea    (%esi,%edx,1),%eax
     705:	05 30 18 00 00       	add    $0x1830,%eax
     70a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
     710:	83 ec 0c             	sub    $0xc,%esp
     713:	8d 83 88 e4 ff ff    	lea    -0x1b78(%ebx),%eax
     719:	50                   	push   %eax
     71a:	e8 3c 07 00 00       	call   e5b <printf>
     71f:	83 c4 10             	add    $0x10,%esp
     722:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     729:	eb 41                	jmp    76c <pthread_create+0xb2>
     72b:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     731:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     734:	89 c8                	mov    %ecx,%eax
     736:	c1 e0 02             	shl    $0x2,%eax
     739:	01 c8                	add    %ecx,%eax
     73b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     742:	01 d0                	add    %edx,%eax
     744:	89 c2                	mov    %eax,%edx
     746:	c1 e2 05             	shl    $0x5,%edx
     749:	29 c2                	sub    %eax,%edx
     74b:	8d 04 12             	lea    (%edx,%edx,1),%eax
     74e:	8d 14 08             	lea    (%eax,%ecx,1),%edx
     751:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
     758:	89 c2                	mov    %eax,%edx
     75a:	8d 04 16             	lea    (%esi,%edx,1),%eax
     75d:	05 30 18 00 00       	add    $0x1830,%eax
     762:	8b 00                	mov    (%eax),%eax
     764:	83 f8 03             	cmp    $0x3,%eax
     767:	74 0b                	je     774 <pthread_create+0xba>
     769:	ff 45 e4             	incl   -0x1c(%ebp)
     76c:	83 7d e4 03          	cmpl   $0x3,-0x1c(%ebp)
     770:	7e b9                	jle    72b <pthread_create+0x71>
     772:	eb 01                	jmp    775 <pthread_create+0xbb>
     774:	90                   	nop
     775:	83 7d e4 04          	cmpl   $0x4,-0x1c(%ebp)
     779:	75 0a                	jne    785 <pthread_create+0xcb>
     77b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     780:	e9 42 02 00 00       	jmp    9c7 <pthread_create+0x30d>
     785:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     788:	8b 45 08             	mov    0x8(%ebp),%eax
     78b:	89 10                	mov    %edx,(%eax)
     78d:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     793:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     796:	89 c8                	mov    %ecx,%eax
     798:	c1 e0 02             	shl    $0x2,%eax
     79b:	01 c8                	add    %ecx,%eax
     79d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     7a4:	01 d0                	add    %edx,%eax
     7a6:	89 c2                	mov    %eax,%edx
     7a8:	c1 e2 05             	shl    $0x5,%edx
     7ab:	29 c2                	sub    %eax,%edx
     7ad:	8d 04 12             	lea    (%edx,%edx,1),%eax
     7b0:	8d 14 08             	lea    (%eax,%ecx,1),%edx
     7b3:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
     7ba:	89 c2                	mov    %eax,%edx
     7bc:	8d 04 16             	lea    (%esi,%edx,1),%eax
     7bf:	05 30 18 00 00       	add    $0x1830,%eax
     7c4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
     7ca:	8b 75 10             	mov    0x10(%ebp),%esi
     7cd:	c7 c7 40 30 00 00    	mov    $0x3040,%edi
     7d3:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     7d6:	89 c8                	mov    %ecx,%eax
     7d8:	c1 e0 02             	shl    $0x2,%eax
     7db:	01 c8                	add    %ecx,%eax
     7dd:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     7e4:	01 d0                	add    %edx,%eax
     7e6:	89 c2                	mov    %eax,%edx
     7e8:	c1 e2 05             	shl    $0x5,%edx
     7eb:	29 c2                	sub    %eax,%edx
     7ed:	8d 04 12             	lea    (%edx,%edx,1),%eax
     7f0:	8d 14 08             	lea    (%eax,%ecx,1),%edx
     7f3:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
     7fa:	89 c2                	mov    %eax,%edx
     7fc:	8d 04 17             	lea    (%edi,%edx,1),%eax
     7ff:	05 20 18 00 00       	add    $0x1820,%eax
     804:	89 30                	mov    %esi,(%eax)
     806:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     809:	89 c8                	mov    %ecx,%eax
     80b:	c1 e0 02             	shl    $0x2,%eax
     80e:	01 c8                	add    %ecx,%eax
     810:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     817:	01 d0                	add    %edx,%eax
     819:	89 c2                	mov    %eax,%edx
     81b:	c1 e2 05             	shl    $0x5,%edx
     81e:	29 c2                	sub    %eax,%edx
     820:	8d 04 12             	lea    (%edx,%edx,1),%eax
     823:	8d 14 08             	lea    (%eax,%ecx,1),%edx
     826:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
     82d:	89 c2                	mov    %eax,%edx
     82f:	81 c2 00 18 00 00    	add    $0x1800,%edx
     835:	c7 c0 40 30 00 00    	mov    $0x3040,%eax
     83b:	01 d0                	add    %edx,%eax
     83d:	89 c6                	mov    %eax,%esi
     83f:	c7 c7 40 30 00 00    	mov    $0x3040,%edi
     845:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     848:	89 c8                	mov    %ecx,%eax
     84a:	c1 e0 02             	shl    $0x2,%eax
     84d:	01 c8                	add    %ecx,%eax
     84f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     856:	01 d0                	add    %edx,%eax
     858:	89 c2                	mov    %eax,%edx
     85a:	c1 e2 05             	shl    $0x5,%edx
     85d:	29 c2                	sub    %eax,%edx
     85f:	8d 04 12             	lea    (%edx,%edx,1),%eax
     862:	8d 14 08             	lea    (%eax,%ecx,1),%edx
     865:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
     86c:	89 c2                	mov    %eax,%edx
     86e:	8d 04 17             	lea    (%edi,%edx,1),%eax
     871:	05 0c 18 00 00       	add    $0x180c,%eax
     876:	89 30                	mov    %esi,(%eax)
     878:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     87b:	89 c8                	mov    %ecx,%eax
     87d:	c1 e0 02             	shl    $0x2,%eax
     880:	01 c8                	add    %ecx,%eax
     882:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     889:	01 d0                	add    %edx,%eax
     88b:	89 c2                	mov    %eax,%edx
     88d:	c1 e2 05             	shl    $0x5,%edx
     890:	29 c2                	sub    %eax,%edx
     892:	8d 04 12             	lea    (%edx,%edx,1),%eax
     895:	8d 14 08             	lea    (%eax,%ecx,1),%edx
     898:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
     89f:	89 c2                	mov    %eax,%edx
     8a1:	81 c2 00 18 00 00    	add    $0x1800,%edx
     8a7:	c7 c0 40 30 00 00    	mov    $0x3040,%eax
     8ad:	01 d0                	add    %edx,%eax
     8af:	89 c6                	mov    %eax,%esi
     8b1:	c7 c7 40 30 00 00    	mov    $0x3040,%edi
     8b7:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     8ba:	89 c8                	mov    %ecx,%eax
     8bc:	c1 e0 02             	shl    $0x2,%eax
     8bf:	01 c8                	add    %ecx,%eax
     8c1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     8c8:	01 d0                	add    %edx,%eax
     8ca:	89 c2                	mov    %eax,%edx
     8cc:	c1 e2 05             	shl    $0x5,%edx
     8cf:	29 c2                	sub    %eax,%edx
     8d1:	8d 04 12             	lea    (%edx,%edx,1),%eax
     8d4:	8d 14 08             	lea    (%eax,%ecx,1),%edx
     8d7:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
     8de:	89 c2                	mov    %eax,%edx
     8e0:	8d 04 17             	lea    (%edi,%edx,1),%eax
     8e3:	05 08 18 00 00       	add    $0x1808,%eax
     8e8:	89 30                	mov    %esi,(%eax)
     8ea:	8b 75 14             	mov    0x14(%ebp),%esi
     8ed:	c7 c7 40 30 00 00    	mov    $0x3040,%edi
     8f3:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     8f6:	89 c8                	mov    %ecx,%eax
     8f8:	c1 e0 02             	shl    $0x2,%eax
     8fb:	01 c8                	add    %ecx,%eax
     8fd:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     904:	01 d0                	add    %edx,%eax
     906:	89 c2                	mov    %eax,%edx
     908:	c1 e2 05             	shl    $0x5,%edx
     90b:	29 c2                	sub    %eax,%edx
     90d:	8d 04 12             	lea    (%edx,%edx,1),%eax
     910:	8d 14 08             	lea    (%eax,%ecx,1),%edx
     913:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
     91a:	89 c2                	mov    %eax,%edx
     91c:	8d 04 17             	lea    (%edi,%edx,1),%eax
     91f:	05 04 18 00 00       	add    $0x1804,%eax
     924:	89 30                	mov    %esi,(%eax)
     926:	c7 c0 30 91 00 00    	mov    $0x9130,%eax
     92c:	8b 08                	mov    (%eax),%ecx
     92e:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     934:	89 c8                	mov    %ecx,%eax
     936:	c1 e0 02             	shl    $0x2,%eax
     939:	01 c8                	add    %ecx,%eax
     93b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     942:	01 d0                	add    %edx,%eax
     944:	89 c2                	mov    %eax,%edx
     946:	c1 e2 05             	shl    $0x5,%edx
     949:	29 c2                	sub    %eax,%edx
     94b:	8d 04 12             	lea    (%edx,%edx,1),%eax
     94e:	8d 14 08             	lea    (%eax,%ecx,1),%edx
     951:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
     958:	89 c2                	mov    %eax,%edx
     95a:	8d 04 16             	lea    (%esi,%edx,1),%eax
     95d:	05 0c 18 00 00       	add    $0x180c,%eax
     962:	89 20                	mov    %esp,(%eax)
     964:	c7 c0 30 91 00 00    	mov    $0x9130,%eax
     96a:	8b 08                	mov    (%eax),%ecx
     96c:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     972:	89 c8                	mov    %ecx,%eax
     974:	c1 e0 02             	shl    $0x2,%eax
     977:	01 c8                	add    %ecx,%eax
     979:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     980:	01 d0                	add    %edx,%eax
     982:	89 c2                	mov    %eax,%edx
     984:	c1 e2 05             	shl    $0x5,%edx
     987:	29 c2                	sub    %eax,%edx
     989:	8d 04 12             	lea    (%edx,%edx,1),%eax
     98c:	8d 14 08             	lea    (%eax,%ecx,1),%edx
     98f:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
     996:	89 c2                	mov    %eax,%edx
     998:	8d 04 16             	lea    (%esi,%edx,1),%eax
     99b:	05 08 18 00 00       	add    $0x1808,%eax
     9a0:	89 28                	mov    %ebp,(%eax)
     9a2:	83 ec 0c             	sub    $0xc,%esp
     9a5:	ff 75 e4             	pushl  -0x1c(%ebp)
     9a8:	e8 5e f9 ff ff       	call   30b <creatediaoyong>
     9ad:	83 c4 10             	add    $0x10,%esp
     9b0:	83 ec 0c             	sub    $0xc,%esp
     9b3:	8d 83 90 e4 ff ff    	lea    -0x1b70(%ebx),%eax
     9b9:	50                   	push   %eax
     9ba:	e8 9c 04 00 00       	call   e5b <printf>
     9bf:	83 c4 10             	add    $0x10,%esp
     9c2:	b8 00 00 00 00       	mov    $0x0,%eax
     9c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9ca:	5b                   	pop    %ebx
     9cb:	5e                   	pop    %esi
     9cc:	5f                   	pop    %edi
     9cd:	5d                   	pop    %ebp
     9ce:	c3                   	ret    

000009cf <pthread_exit>:
     9cf:	55                   	push   %ebp
     9d0:	89 e5                	mov    %esp,%ebp
     9d2:	56                   	push   %esi
     9d3:	53                   	push   %ebx
     9d4:	e8 23 04 00 00       	call   dfc <__x86.get_pc_thunk.ax>
     9d9:	05 27 26 00 00       	add    $0x2627,%eax
     9de:	c7 c2 30 91 00 00    	mov    $0x9130,%edx
     9e4:	8b 1a                	mov    (%edx),%ebx
     9e6:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     9ec:	89 da                	mov    %ebx,%edx
     9ee:	c1 e2 02             	shl    $0x2,%edx
     9f1:	01 da                	add    %ebx,%edx
     9f3:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
     9fa:	01 ca                	add    %ecx,%edx
     9fc:	89 d1                	mov    %edx,%ecx
     9fe:	c1 e1 05             	shl    $0x5,%ecx
     a01:	29 d1                	sub    %edx,%ecx
     a03:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
     a06:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
     a09:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
     a10:	89 d1                	mov    %edx,%ecx
     a12:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
     a15:	81 c2 30 18 00 00    	add    $0x1830,%edx
     a1b:	8b 12                	mov    (%edx),%edx
     a1d:	83 fa 03             	cmp    $0x3,%edx
     a20:	0f 84 d1 00 00 00    	je     af7 <pthread_exit+0x128>
     a26:	c7 c2 30 91 00 00    	mov    $0x9130,%edx
     a2c:	8b 1a                	mov    (%edx),%ebx
     a2e:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     a34:	89 da                	mov    %ebx,%edx
     a36:	c1 e2 02             	shl    $0x2,%edx
     a39:	01 da                	add    %ebx,%edx
     a3b:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
     a42:	01 ca                	add    %ecx,%edx
     a44:	89 d1                	mov    %edx,%ecx
     a46:	c1 e1 05             	shl    $0x5,%ecx
     a49:	29 d1                	sub    %edx,%ecx
     a4b:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
     a4e:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
     a51:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
     a58:	89 d1                	mov    %edx,%ecx
     a5a:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
     a5d:	81 c2 38 18 00 00    	add    $0x1838,%edx
     a63:	c7 02 ff ff ff ff    	movl   $0xffffffff,(%edx)
     a69:	c7 c2 30 91 00 00    	mov    $0x9130,%edx
     a6f:	8b 1a                	mov    (%edx),%ebx
     a71:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     a77:	89 da                	mov    %ebx,%edx
     a79:	c1 e2 02             	shl    $0x2,%edx
     a7c:	01 da                	add    %ebx,%edx
     a7e:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
     a85:	01 ca                	add    %ecx,%edx
     a87:	89 d1                	mov    %edx,%ecx
     a89:	c1 e1 05             	shl    $0x5,%ecx
     a8c:	29 d1                	sub    %edx,%ecx
     a8e:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
     a91:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
     a94:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
     a9b:	89 d1                	mov    %edx,%ecx
     a9d:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
     aa0:	81 c2 30 18 00 00    	add    $0x1830,%edx
     aa6:	c7 02 03 00 00 00    	movl   $0x3,(%edx)
     aac:	c7 c2 30 91 00 00    	mov    $0x9130,%edx
     ab2:	8b 0a                	mov    (%edx),%ecx
     ab4:	c7 c3 40 30 00 00    	mov    $0x3040,%ebx
     aba:	89 c8                	mov    %ecx,%eax
     abc:	c1 e0 02             	shl    $0x2,%eax
     abf:	01 c8                	add    %ecx,%eax
     ac1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     ac8:	01 d0                	add    %edx,%eax
     aca:	89 c2                	mov    %eax,%edx
     acc:	c1 e2 05             	shl    $0x5,%edx
     acf:	29 c2                	sub    %eax,%edx
     ad1:	8d 04 12             	lea    (%edx,%edx,1),%eax
     ad4:	8d 14 08             	lea    (%eax,%ecx,1),%edx
     ad7:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
     ade:	89 c2                	mov    %eax,%edx
     ae0:	8d 04 13             	lea    (%ebx,%edx,1),%eax
     ae3:	05 38 18 00 00       	add    $0x1838,%eax
     ae8:	8b 10                	mov    (%eax),%edx
     aea:	8b 45 08             	mov    0x8(%ebp),%eax
     aed:	89 10                	mov    %edx,(%eax)
     aef:	e8 7e f9 ff ff       	call   472 <diaoyong>
     af4:	90                   	nop
     af5:	eb 01                	jmp    af8 <pthread_exit+0x129>
     af7:	90                   	nop
     af8:	5b                   	pop    %ebx
     af9:	5e                   	pop    %esi
     afa:	5d                   	pop    %ebp
     afb:	c3                   	ret    

00000afc <pthread_join>:
     afc:	55                   	push   %ebp
     afd:	89 e5                	mov    %esp,%ebp
     aff:	57                   	push   %edi
     b00:	56                   	push   %esi
     b01:	53                   	push   %ebx
     b02:	83 ec 0c             	sub    $0xc,%esp
     b05:	e8 f2 02 00 00       	call   dfc <__x86.get_pc_thunk.ax>
     b0a:	05 f6 24 00 00       	add    $0x24f6,%eax
     b0f:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     b15:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b18:	89 da                	mov    %ebx,%edx
     b1a:	c1 e2 02             	shl    $0x2,%edx
     b1d:	01 da                	add    %ebx,%edx
     b1f:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
     b26:	01 ca                	add    %ecx,%edx
     b28:	89 d1                	mov    %edx,%ecx
     b2a:	c1 e1 05             	shl    $0x5,%ecx
     b2d:	29 d1                	sub    %edx,%ecx
     b2f:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
     b32:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
     b35:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
     b3c:	89 d1                	mov    %edx,%ecx
     b3e:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
     b41:	81 c2 30 18 00 00    	add    $0x1830,%edx
     b47:	8b 12                	mov    (%edx),%edx
     b49:	83 fa 03             	cmp    $0x3,%edx
     b4c:	75 0a                	jne    b58 <pthread_join+0x5c>
     b4e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     b53:	e9 9e 01 00 00       	jmp    cf6 <pthread_join+0x1fa>
     b58:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     b5e:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b61:	89 da                	mov    %ebx,%edx
     b63:	c1 e2 02             	shl    $0x2,%edx
     b66:	01 da                	add    %ebx,%edx
     b68:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
     b6f:	01 ca                	add    %ecx,%edx
     b71:	89 d1                	mov    %edx,%ecx
     b73:	c1 e1 05             	shl    $0x5,%ecx
     b76:	29 d1                	sub    %edx,%ecx
     b78:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
     b7b:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
     b7e:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
     b85:	89 d1                	mov    %edx,%ecx
     b87:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
     b8a:	81 c2 30 18 00 00    	add    $0x1830,%edx
     b90:	8b 12                	mov    (%edx),%edx
     b92:	85 d2                	test   %edx,%edx
     b94:	74 0a                	je     ba0 <pthread_join+0xa4>
     b96:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     b9b:	e9 56 01 00 00       	jmp    cf6 <pthread_join+0x1fa>
     ba0:	c7 c2 30 91 00 00    	mov    $0x9130,%edx
     ba6:	8b 1a                	mov    (%edx),%ebx
     ba8:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     bae:	89 da                	mov    %ebx,%edx
     bb0:	c1 e2 02             	shl    $0x2,%edx
     bb3:	01 da                	add    %ebx,%edx
     bb5:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
     bbc:	01 ca                	add    %ecx,%edx
     bbe:	89 d1                	mov    %edx,%ecx
     bc0:	c1 e1 05             	shl    $0x5,%ecx
     bc3:	29 d1                	sub    %edx,%ecx
     bc5:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
     bc8:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
     bcb:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
     bd2:	89 d1                	mov    %edx,%ecx
     bd4:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
     bd7:	81 c2 30 18 00 00    	add    $0x1830,%edx
     bdd:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
     be3:	c7 c2 30 91 00 00    	mov    $0x9130,%edx
     be9:	8b 12                	mov    (%edx),%edx
     beb:	89 d6                	mov    %edx,%esi
     bed:	c7 c7 40 30 00 00    	mov    $0x3040,%edi
     bf3:	8b 5d 08             	mov    0x8(%ebp),%ebx
     bf6:	89 da                	mov    %ebx,%edx
     bf8:	c1 e2 02             	shl    $0x2,%edx
     bfb:	01 da                	add    %ebx,%edx
     bfd:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
     c04:	01 ca                	add    %ecx,%edx
     c06:	89 d1                	mov    %edx,%ecx
     c08:	c1 e1 05             	shl    $0x5,%ecx
     c0b:	29 d1                	sub    %edx,%ecx
     c0d:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
     c10:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
     c13:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
     c1a:	89 d1                	mov    %edx,%ecx
     c1c:	8d 14 0f             	lea    (%edi,%ecx,1),%edx
     c1f:	81 c2 38 18 00 00    	add    $0x1838,%edx
     c25:	89 32                	mov    %esi,(%edx)
     c27:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     c2d:	8b 5d 08             	mov    0x8(%ebp),%ebx
     c30:	89 da                	mov    %ebx,%edx
     c32:	c1 e2 02             	shl    $0x2,%edx
     c35:	01 da                	add    %ebx,%edx
     c37:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
     c3e:	01 ca                	add    %ecx,%edx
     c40:	89 d1                	mov    %edx,%ecx
     c42:	c1 e1 05             	shl    $0x5,%ecx
     c45:	29 d1                	sub    %edx,%ecx
     c47:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
     c4a:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
     c4d:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
     c54:	89 d1                	mov    %edx,%ecx
     c56:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
     c59:	81 c2 30 18 00 00    	add    $0x1830,%edx
     c5f:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     c65:	c7 c2 30 91 00 00    	mov    $0x9130,%edx
     c6b:	8b 1a                	mov    (%edx),%ebx
     c6d:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     c73:	89 da                	mov    %ebx,%edx
     c75:	c1 e2 02             	shl    $0x2,%edx
     c78:	01 da                	add    %ebx,%edx
     c7a:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
     c81:	01 ca                	add    %ecx,%edx
     c83:	89 d1                	mov    %edx,%ecx
     c85:	c1 e1 05             	shl    $0x5,%ecx
     c88:	29 d1                	sub    %edx,%ecx
     c8a:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
     c8d:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
     c90:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
     c97:	89 d1                	mov    %edx,%ecx
     c99:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
     c9c:	81 c2 0c 18 00 00    	add    $0x180c,%edx
     ca2:	89 22                	mov    %esp,(%edx)
     ca4:	c7 c2 30 91 00 00    	mov    $0x9130,%edx
     caa:	8b 0a                	mov    (%edx),%ecx
     cac:	c7 c3 40 30 00 00    	mov    $0x3040,%ebx
     cb2:	89 c8                	mov    %ecx,%eax
     cb4:	c1 e0 02             	shl    $0x2,%eax
     cb7:	01 c8                	add    %ecx,%eax
     cb9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     cc0:	01 d0                	add    %edx,%eax
     cc2:	89 c2                	mov    %eax,%edx
     cc4:	c1 e2 05             	shl    $0x5,%edx
     cc7:	29 c2                	sub    %eax,%edx
     cc9:	8d 04 12             	lea    (%edx,%edx,1),%eax
     ccc:	8d 14 08             	lea    (%eax,%ecx,1),%edx
     ccf:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
     cd6:	89 c2                	mov    %eax,%edx
     cd8:	8d 04 13             	lea    (%ebx,%edx,1),%eax
     cdb:	05 08 18 00 00       	add    $0x1808,%eax
     ce0:	89 28                	mov    %ebp,(%eax)
     ce2:	8b 45 08             	mov    0x8(%ebp),%eax
     ce5:	83 ec 0c             	sub    $0xc,%esp
     ce8:	50                   	push   %eax
     ce9:	e8 1d f6 ff ff       	call   30b <creatediaoyong>
     cee:	83 c4 10             	add    $0x10,%esp
     cf1:	b8 00 00 00 00       	mov    $0x0,%eax
     cf6:	8d 65 f4             	lea    -0xc(%ebp),%esp
     cf9:	5b                   	pop    %ebx
     cfa:	5e                   	pop    %esi
     cfb:	5f                   	pop    %edi
     cfc:	5d                   	pop    %ebp
     cfd:	c3                   	ret    

00000cfe <pthread_yield>:
     cfe:	55                   	push   %ebp
     cff:	89 e5                	mov    %esp,%ebp
     d01:	56                   	push   %esi
     d02:	53                   	push   %ebx
     d03:	e8 f4 00 00 00       	call   dfc <__x86.get_pc_thunk.ax>
     d08:	05 f8 22 00 00       	add    $0x22f8,%eax
     d0d:	c7 c2 30 91 00 00    	mov    $0x9130,%edx
     d13:	8b 1a                	mov    (%edx),%ebx
     d15:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     d1b:	89 da                	mov    %ebx,%edx
     d1d:	c1 e2 02             	shl    $0x2,%edx
     d20:	01 da                	add    %ebx,%edx
     d22:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
     d29:	01 ca                	add    %ecx,%edx
     d2b:	89 d1                	mov    %edx,%ecx
     d2d:	c1 e1 05             	shl    $0x5,%ecx
     d30:	29 d1                	sub    %edx,%ecx
     d32:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
     d35:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
     d38:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
     d3f:	89 d1                	mov    %edx,%ecx
     d41:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
     d44:	81 c2 30 18 00 00    	add    $0x1830,%edx
     d4a:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
     d50:	c7 c2 30 91 00 00    	mov    $0x9130,%edx
     d56:	8b 1a                	mov    (%edx),%ebx
     d58:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     d5e:	89 da                	mov    %ebx,%edx
     d60:	c1 e2 02             	shl    $0x2,%edx
     d63:	01 da                	add    %ebx,%edx
     d65:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
     d6c:	01 ca                	add    %ecx,%edx
     d6e:	89 d1                	mov    %edx,%ecx
     d70:	c1 e1 05             	shl    $0x5,%ecx
     d73:	29 d1                	sub    %edx,%ecx
     d75:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
     d78:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
     d7b:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
     d82:	89 d1                	mov    %edx,%ecx
     d84:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
     d87:	81 c2 0c 18 00 00    	add    $0x180c,%edx
     d8d:	89 22                	mov    %esp,(%edx)
     d8f:	c7 c2 30 91 00 00    	mov    $0x9130,%edx
     d95:	8b 1a                	mov    (%edx),%ebx
     d97:	c7 c6 40 30 00 00    	mov    $0x3040,%esi
     d9d:	89 da                	mov    %ebx,%edx
     d9f:	c1 e2 02             	shl    $0x2,%edx
     da2:	01 da                	add    %ebx,%edx
     da4:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
     dab:	01 ca                	add    %ecx,%edx
     dad:	89 d1                	mov    %edx,%ecx
     daf:	c1 e1 05             	shl    $0x5,%ecx
     db2:	29 d1                	sub    %edx,%ecx
     db4:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
     db7:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
     dba:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
     dc1:	89 d1                	mov    %edx,%ecx
     dc3:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
     dc6:	81 c2 08 18 00 00    	add    $0x1808,%edx
     dcc:	89 2a                	mov    %ebp,(%edx)
     dce:	c7 c2 30 91 00 00    	mov    $0x9130,%edx
     dd4:	8b 12                	mov    (%edx),%edx
     dd6:	83 ec 08             	sub    $0x8,%esp
     dd9:	52                   	push   %edx
     dda:	8d 90 a1 e4 ff ff    	lea    -0x1b5f(%eax),%edx
     de0:	52                   	push   %edx
     de1:	89 c3                	mov    %eax,%ebx
     de3:	e8 73 00 00 00       	call   e5b <printf>
     de8:	83 c4 10             	add    $0x10,%esp
     deb:	e8 82 f6 ff ff       	call   472 <diaoyong>
     df0:	b8 00 00 00 00       	mov    $0x0,%eax
     df5:	8d 65 f8             	lea    -0x8(%ebp),%esp
     df8:	5b                   	pop    %ebx
     df9:	5e                   	pop    %esi
     dfa:	5d                   	pop    %ebp
     dfb:	c3                   	ret    

00000dfc <__x86.get_pc_thunk.ax>:
     dfc:	8b 04 24             	mov    (%esp),%eax
     dff:	c3                   	ret    

00000e00 <__x86.get_pc_thunk.dx>:
     e00:	8b 14 24             	mov    (%esp),%edx
     e03:	c3                   	ret    

00000e04 <syscall>:
     e04:	55                   	push   %ebp
     e05:	89 e5                	mov    %esp,%ebp
     e07:	83 ec 20             	sub    $0x20,%esp
     e0a:	e8 ed ff ff ff       	call   dfc <__x86.get_pc_thunk.ax>
     e0f:	05 f1 21 00 00       	add    $0x21f1,%eax
     e14:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     e1b:	89 45 f8             	mov    %eax,-0x8(%ebp)
     e1e:	89 4d f4             	mov    %ecx,-0xc(%ebp)
     e21:	89 55 f0             	mov    %edx,-0x10(%ebp)
     e24:	89 5d ec             	mov    %ebx,-0x14(%ebp)
     e27:	89 75 e8             	mov    %esi,-0x18(%ebp)
     e2a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     e2d:	8b 45 08             	mov    0x8(%ebp),%eax
     e30:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     e33:	8b 55 10             	mov    0x10(%ebp),%edx
     e36:	8b 5d 14             	mov    0x14(%ebp),%ebx
     e39:	8b 75 18             	mov    0x18(%ebp),%esi
     e3c:	8b 7d 1c             	mov    0x1c(%ebp),%edi
     e3f:	cd 80                	int    $0x80
     e41:	89 45 fc             	mov    %eax,-0x4(%ebp)
     e44:	8b 45 f8             	mov    -0x8(%ebp),%eax
     e47:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     e4a:	8b 55 f0             	mov    -0x10(%ebp),%edx
     e4d:	8b 5d ec             	mov    -0x14(%ebp),%ebx
     e50:	8b 75 e8             	mov    -0x18(%ebp),%esi
     e53:	8b 7d e4             	mov    -0x1c(%ebp),%edi
     e56:	8b 45 fc             	mov    -0x4(%ebp),%eax
     e59:	c9                   	leave  
     e5a:	c3                   	ret    

00000e5b <printf>:
     e5b:	55                   	push   %ebp
     e5c:	89 e5                	mov    %esp,%ebp
     e5e:	81 ec 38 01 00 00    	sub    $0x138,%esp
     e64:	e8 93 ff ff ff       	call   dfc <__x86.get_pc_thunk.ax>
     e69:	05 97 21 00 00       	add    $0x2197,%eax
     e6e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     e75:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     e7c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     e83:	8d 45 08             	lea    0x8(%ebp),%eax
     e86:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     e89:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
     e90:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
     e97:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
     e9e:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
     ea5:	c6 45 d7 00          	movb   $0x0,-0x29(%ebp)
     ea9:	e9 ce 01 00 00       	jmp    107c <printf+0x221>
     eae:	8b 45 e8             	mov    -0x18(%ebp),%eax
     eb1:	83 f8 01             	cmp    $0x1,%eax
     eb4:	74 54                	je     f0a <printf+0xaf>
     eb6:	83 f8 02             	cmp    $0x2,%eax
     eb9:	0f 84 84 01 00 00    	je     1043 <printf+0x1e8>
     ebf:	85 c0                	test   %eax,%eax
     ec1:	74 05                	je     ec8 <printf+0x6d>
     ec3:	e9 7c 01 00 00       	jmp    1044 <printf+0x1e9>
     ec8:	8b 55 08             	mov    0x8(%ebp),%edx
     ecb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ece:	01 d0                	add    %edx,%eax
     ed0:	8a 00                	mov    (%eax),%al
     ed2:	0f be c0             	movsbl %al,%eax
     ed5:	83 f8 25             	cmp    $0x25,%eax
     ed8:	75 09                	jne    ee3 <printf+0x88>
     eda:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
     ee1:	eb 22                	jmp    f05 <printf+0xaa>
     ee3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
     eea:	8b 55 08             	mov    0x8(%ebp),%edx
     eed:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ef0:	01 d0                	add    %edx,%eax
     ef2:	8a 00                	mov    (%eax),%al
     ef4:	8d 8d d7 fe ff ff    	lea    -0x129(%ebp),%ecx
     efa:	8b 55 f0             	mov    -0x10(%ebp),%edx
     efd:	01 ca                	add    %ecx,%edx
     eff:	88 02                	mov    %al,(%edx)
     f01:	ff 45 f0             	incl   -0x10(%ebp)
     f04:	90                   	nop
     f05:	e9 3a 01 00 00       	jmp    1044 <printf+0x1e9>
     f0a:	8b 55 08             	mov    0x8(%ebp),%edx
     f0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f10:	01 d0                	add    %edx,%eax
     f12:	8a 00                	mov    (%eax),%al
     f14:	0f be c0             	movsbl %al,%eax
     f17:	83 f8 64             	cmp    $0x64,%eax
     f1a:	74 48                	je     f64 <printf+0x109>
     f1c:	83 f8 64             	cmp    $0x64,%eax
     f1f:	7f 13                	jg     f34 <printf+0xd9>
     f21:	83 f8 25             	cmp    $0x25,%eax
     f24:	74 21                	je     f47 <printf+0xec>
     f26:	83 f8 63             	cmp    $0x63,%eax
     f29:	0f 84 dd 00 00 00    	je     100c <printf+0x1b1>
     f2f:	e9 05 01 00 00       	jmp    1039 <printf+0x1de>
     f34:	83 f8 73             	cmp    $0x73,%eax
     f37:	0f 84 98 00 00 00    	je     fd5 <printf+0x17a>
     f3d:	83 f8 78             	cmp    $0x78,%eax
     f40:	74 5c                	je     f9e <printf+0x143>
     f42:	e9 f2 00 00 00       	jmp    1039 <printf+0x1de>
     f47:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
     f4e:	8d 95 d7 fe ff ff    	lea    -0x129(%ebp),%edx
     f54:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f57:	01 d0                	add    %edx,%eax
     f59:	c6 00 25             	movb   $0x25,(%eax)
     f5c:	ff 45 f0             	incl   -0x10(%ebp)
     f5f:	e9 dd 00 00 00       	jmp    1041 <printf+0x1e6>
     f64:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
     f6b:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
     f6f:	8b 55 ec             	mov    -0x14(%ebp),%edx
     f72:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f75:	01 d0                	add    %edx,%eax
     f77:	8b 00                	mov    (%eax),%eax
     f79:	89 45 e0             	mov    %eax,-0x20(%ebp)
     f7c:	ff 75 f0             	pushl  -0x10(%ebp)
     f7f:	68 00 01 00 00       	push   $0x100
     f84:	8d 85 d7 fe ff ff    	lea    -0x129(%ebp),%eax
     f8a:	50                   	push   %eax
     f8b:	ff 75 e0             	pushl  -0x20(%ebp)
     f8e:	e8 29 01 00 00       	call   10bc <dec2Str>
     f93:	83 c4 10             	add    $0x10,%esp
     f96:	89 45 f0             	mov    %eax,-0x10(%ebp)
     f99:	e9 a3 00 00 00       	jmp    1041 <printf+0x1e6>
     f9e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
     fa5:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
     fa9:	8b 55 ec             	mov    -0x14(%ebp),%edx
     fac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     faf:	01 d0                	add    %edx,%eax
     fb1:	8b 00                	mov    (%eax),%eax
     fb3:	89 45 dc             	mov    %eax,-0x24(%ebp)
     fb6:	ff 75 f0             	pushl  -0x10(%ebp)
     fb9:	68 00 01 00 00       	push   $0x100
     fbe:	8d 85 d7 fe ff ff    	lea    -0x129(%ebp),%eax
     fc4:	50                   	push   %eax
     fc5:	ff 75 dc             	pushl  -0x24(%ebp)
     fc8:	e8 9b 02 00 00       	call   1268 <hex2Str>
     fcd:	83 c4 10             	add    $0x10,%esp
     fd0:	89 45 f0             	mov    %eax,-0x10(%ebp)
     fd3:	eb 6c                	jmp    1041 <printf+0x1e6>
     fd5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
     fdc:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
     fe0:	8b 55 ec             	mov    -0x14(%ebp),%edx
     fe3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     fe6:	01 d0                	add    %edx,%eax
     fe8:	8b 00                	mov    (%eax),%eax
     fea:	89 45 d8             	mov    %eax,-0x28(%ebp)
     fed:	ff 75 f0             	pushl  -0x10(%ebp)
     ff0:	68 00 01 00 00       	push   $0x100
     ff5:	8d 85 d7 fe ff ff    	lea    -0x129(%ebp),%eax
     ffb:	50                   	push   %eax
     ffc:	ff 75 d8             	pushl  -0x28(%ebp)
     fff:	e8 51 03 00 00       	call   1355 <str2Str>
    1004:	83 c4 10             	add    $0x10,%esp
    1007:	89 45 f0             	mov    %eax,-0x10(%ebp)
    100a:	eb 35                	jmp    1041 <printf+0x1e6>
    100c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    1013:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
    1017:	8b 55 ec             	mov    -0x14(%ebp),%edx
    101a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    101d:	01 d0                	add    %edx,%eax
    101f:	8a 00                	mov    (%eax),%al
    1021:	88 45 d7             	mov    %al,-0x29(%ebp)
    1024:	8d 95 d7 fe ff ff    	lea    -0x129(%ebp),%edx
    102a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    102d:	01 c2                	add    %eax,%edx
    102f:	8a 45 d7             	mov    -0x29(%ebp),%al
    1032:	88 02                	mov    %al,(%edx)
    1034:	ff 45 f0             	incl   -0x10(%ebp)
    1037:	eb 08                	jmp    1041 <printf+0x1e6>
    1039:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
    1040:	90                   	nop
    1041:	eb 01                	jmp    1044 <printf+0x1e9>
    1043:	90                   	nop
    1044:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
    1048:	74 46                	je     1090 <printf+0x235>
    104a:	81 7d f0 00 01 00 00 	cmpl   $0x100,-0x10(%ebp)
    1051:	75 26                	jne    1079 <printf+0x21e>
    1053:	8d 85 d7 fe ff ff    	lea    -0x129(%ebp),%eax
    1059:	83 ec 08             	sub    $0x8,%esp
    105c:	6a 00                	push   $0x0
    105e:	6a 00                	push   $0x0
    1060:	68 00 01 00 00       	push   $0x100
    1065:	50                   	push   %eax
    1066:	6a 00                	push   $0x0
    1068:	6a 00                	push   $0x0
    106a:	e8 95 fd ff ff       	call   e04 <syscall>
    106f:	83 c4 20             	add    $0x20,%esp
    1072:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1079:	ff 45 f4             	incl   -0xc(%ebp)
    107c:	8b 55 08             	mov    0x8(%ebp),%edx
    107f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1082:	01 d0                	add    %edx,%eax
    1084:	8a 00                	mov    (%eax),%al
    1086:	84 c0                	test   %al,%al
    1088:	0f 85 20 fe ff ff    	jne    eae <printf+0x53>
    108e:	eb 01                	jmp    1091 <printf+0x236>
    1090:	90                   	nop
    1091:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1095:	74 1e                	je     10b5 <printf+0x25a>
    1097:	8b 55 f0             	mov    -0x10(%ebp),%edx
    109a:	8d 85 d7 fe ff ff    	lea    -0x129(%ebp),%eax
    10a0:	83 ec 08             	sub    $0x8,%esp
    10a3:	6a 00                	push   $0x0
    10a5:	6a 00                	push   $0x0
    10a7:	52                   	push   %edx
    10a8:	50                   	push   %eax
    10a9:	6a 00                	push   $0x0
    10ab:	6a 00                	push   $0x0
    10ad:	e8 52 fd ff ff       	call   e04 <syscall>
    10b2:	83 c4 20             	add    $0x20,%esp
    10b5:	b8 00 00 00 00       	mov    $0x0,%eax
    10ba:	c9                   	leave  
    10bb:	c3                   	ret    

000010bc <dec2Str>:
    10bc:	55                   	push   %ebp
    10bd:	89 e5                	mov    %esp,%ebp
    10bf:	83 ec 50             	sub    $0x50,%esp
    10c2:	e8 35 fd ff ff       	call   dfc <__x86.get_pc_thunk.ax>
    10c7:	05 39 1f 00 00       	add    $0x1f39,%eax
    10cc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    10d3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    10d7:	0f 89 b6 00 00 00    	jns    1193 <dec2Str+0xd7>
    10dd:	8b 55 14             	mov    0x14(%ebp),%edx
    10e0:	8b 45 0c             	mov    0xc(%ebp),%eax
    10e3:	01 d0                	add    %edx,%eax
    10e5:	c6 00 2d             	movb   $0x2d,(%eax)
    10e8:	ff 45 14             	incl   0x14(%ebp)
    10eb:	8b 45 14             	mov    0x14(%ebp),%eax
    10ee:	3b 45 10             	cmp    0x10(%ebp),%eax
    10f1:	75 1f                	jne    1112 <dec2Str+0x56>
    10f3:	8b 55 10             	mov    0x10(%ebp),%edx
    10f6:	8b 45 0c             	mov    0xc(%ebp),%eax
    10f9:	6a 00                	push   $0x0
    10fb:	6a 00                	push   $0x0
    10fd:	52                   	push   %edx
    10fe:	50                   	push   %eax
    10ff:	6a 00                	push   $0x0
    1101:	6a 00                	push   $0x0
    1103:	e8 fc fc ff ff       	call   e04 <syscall>
    1108:	83 c4 18             	add    $0x18,%esp
    110b:	c7 45 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
    1112:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1115:	b8 67 66 66 66       	mov    $0x66666667,%eax
    111a:	f7 e9                	imul   %ecx
    111c:	c1 fa 02             	sar    $0x2,%edx
    111f:	89 c8                	mov    %ecx,%eax
    1121:	c1 f8 1f             	sar    $0x1f,%eax
    1124:	29 c2                	sub    %eax,%edx
    1126:	89 d0                	mov    %edx,%eax
    1128:	89 45 f8             	mov    %eax,-0x8(%ebp)
    112b:	8b 55 f8             	mov    -0x8(%ebp),%edx
    112e:	89 d0                	mov    %edx,%eax
    1130:	c1 e0 02             	shl    $0x2,%eax
    1133:	01 d0                	add    %edx,%eax
    1135:	01 c0                	add    %eax,%eax
    1137:	2b 45 08             	sub    0x8(%ebp),%eax
    113a:	89 c2                	mov    %eax,%edx
    113c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    113f:	89 54 85 b8          	mov    %edx,-0x48(%ebp,%eax,4)
    1143:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1146:	89 45 08             	mov    %eax,0x8(%ebp)
    1149:	ff 45 fc             	incl   -0x4(%ebp)
    114c:	eb 3a                	jmp    1188 <dec2Str+0xcc>
    114e:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1151:	b8 67 66 66 66       	mov    $0x66666667,%eax
    1156:	f7 e9                	imul   %ecx
    1158:	c1 fa 02             	sar    $0x2,%edx
    115b:	89 c8                	mov    %ecx,%eax
    115d:	c1 f8 1f             	sar    $0x1f,%eax
    1160:	29 c2                	sub    %eax,%edx
    1162:	89 d0                	mov    %edx,%eax
    1164:	89 45 f8             	mov    %eax,-0x8(%ebp)
    1167:	8b 55 f8             	mov    -0x8(%ebp),%edx
    116a:	89 d0                	mov    %edx,%eax
    116c:	c1 e0 02             	shl    $0x2,%eax
    116f:	01 d0                	add    %edx,%eax
    1171:	01 c0                	add    %eax,%eax
    1173:	2b 45 08             	sub    0x8(%ebp),%eax
    1176:	89 c2                	mov    %eax,%edx
    1178:	8b 45 fc             	mov    -0x4(%ebp),%eax
    117b:	89 54 85 b8          	mov    %edx,-0x48(%ebp,%eax,4)
    117f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1182:	89 45 08             	mov    %eax,0x8(%ebp)
    1185:	ff 45 fc             	incl   -0x4(%ebp)
    1188:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    118c:	75 c0                	jne    114e <dec2Str+0x92>
    118e:	e9 ca 00 00 00       	jmp    125d <dec2Str+0x1a1>
    1193:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1196:	b8 67 66 66 66       	mov    $0x66666667,%eax
    119b:	f7 e9                	imul   %ecx
    119d:	c1 fa 02             	sar    $0x2,%edx
    11a0:	89 c8                	mov    %ecx,%eax
    11a2:	c1 f8 1f             	sar    $0x1f,%eax
    11a5:	29 c2                	sub    %eax,%edx
    11a7:	89 d0                	mov    %edx,%eax
    11a9:	89 45 f8             	mov    %eax,-0x8(%ebp)
    11ac:	8b 55 f8             	mov    -0x8(%ebp),%edx
    11af:	89 d0                	mov    %edx,%eax
    11b1:	c1 e0 02             	shl    $0x2,%eax
    11b4:	01 d0                	add    %edx,%eax
    11b6:	01 c0                	add    %eax,%eax
    11b8:	f7 d8                	neg    %eax
    11ba:	89 c2                	mov    %eax,%edx
    11bc:	8b 45 08             	mov    0x8(%ebp),%eax
    11bf:	01 c2                	add    %eax,%edx
    11c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    11c4:	89 54 85 b8          	mov    %edx,-0x48(%ebp,%eax,4)
    11c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    11cb:	89 45 08             	mov    %eax,0x8(%ebp)
    11ce:	ff 45 fc             	incl   -0x4(%ebp)
    11d1:	eb 3e                	jmp    1211 <dec2Str+0x155>
    11d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
    11d6:	b8 67 66 66 66       	mov    $0x66666667,%eax
    11db:	f7 e9                	imul   %ecx
    11dd:	c1 fa 02             	sar    $0x2,%edx
    11e0:	89 c8                	mov    %ecx,%eax
    11e2:	c1 f8 1f             	sar    $0x1f,%eax
    11e5:	29 c2                	sub    %eax,%edx
    11e7:	89 d0                	mov    %edx,%eax
    11e9:	89 45 f8             	mov    %eax,-0x8(%ebp)
    11ec:	8b 55 f8             	mov    -0x8(%ebp),%edx
    11ef:	89 d0                	mov    %edx,%eax
    11f1:	c1 e0 02             	shl    $0x2,%eax
    11f4:	01 d0                	add    %edx,%eax
    11f6:	01 c0                	add    %eax,%eax
    11f8:	f7 d8                	neg    %eax
    11fa:	89 c2                	mov    %eax,%edx
    11fc:	8b 45 08             	mov    0x8(%ebp),%eax
    11ff:	01 c2                	add    %eax,%edx
    1201:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1204:	89 54 85 b8          	mov    %edx,-0x48(%ebp,%eax,4)
    1208:	8b 45 f8             	mov    -0x8(%ebp),%eax
    120b:	89 45 08             	mov    %eax,0x8(%ebp)
    120e:	ff 45 fc             	incl   -0x4(%ebp)
    1211:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    1215:	75 bc                	jne    11d3 <dec2Str+0x117>
    1217:	eb 44                	jmp    125d <dec2Str+0x1a1>
    1219:	8b 45 fc             	mov    -0x4(%ebp),%eax
    121c:	48                   	dec    %eax
    121d:	8b 44 85 b8          	mov    -0x48(%ebp,%eax,4),%eax
    1221:	8d 48 30             	lea    0x30(%eax),%ecx
    1224:	8b 55 14             	mov    0x14(%ebp),%edx
    1227:	8b 45 0c             	mov    0xc(%ebp),%eax
    122a:	01 d0                	add    %edx,%eax
    122c:	88 ca                	mov    %cl,%dl
    122e:	88 10                	mov    %dl,(%eax)
    1230:	ff 45 14             	incl   0x14(%ebp)
    1233:	8b 45 14             	mov    0x14(%ebp),%eax
    1236:	3b 45 10             	cmp    0x10(%ebp),%eax
    1239:	75 1f                	jne    125a <dec2Str+0x19e>
    123b:	8b 55 10             	mov    0x10(%ebp),%edx
    123e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1241:	6a 00                	push   $0x0
    1243:	6a 00                	push   $0x0
    1245:	52                   	push   %edx
    1246:	50                   	push   %eax
    1247:	6a 00                	push   $0x0
    1249:	6a 00                	push   $0x0
    124b:	e8 b4 fb ff ff       	call   e04 <syscall>
    1250:	83 c4 18             	add    $0x18,%esp
    1253:	c7 45 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
    125a:	ff 4d fc             	decl   -0x4(%ebp)
    125d:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
    1261:	75 b6                	jne    1219 <dec2Str+0x15d>
    1263:	8b 45 14             	mov    0x14(%ebp),%eax
    1266:	c9                   	leave  
    1267:	c3                   	ret    

00001268 <hex2Str>:
    1268:	55                   	push   %ebp
    1269:	89 e5                	mov    %esp,%ebp
    126b:	83 ec 50             	sub    $0x50,%esp
    126e:	e8 89 fb ff ff       	call   dfc <__x86.get_pc_thunk.ax>
    1273:	05 8d 1d 00 00       	add    $0x1d8d,%eax
    1278:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    127f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    1286:	8b 45 08             	mov    0x8(%ebp),%eax
    1289:	c1 e8 04             	shr    $0x4,%eax
    128c:	89 45 f8             	mov    %eax,-0x8(%ebp)
    128f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1292:	c1 e0 04             	shl    $0x4,%eax
    1295:	89 c2                	mov    %eax,%edx
    1297:	8b 45 08             	mov    0x8(%ebp),%eax
    129a:	29 d0                	sub    %edx,%eax
    129c:	89 c2                	mov    %eax,%edx
    129e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12a1:	89 54 85 b8          	mov    %edx,-0x48(%ebp,%eax,4)
    12a5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    12a8:	89 45 08             	mov    %eax,0x8(%ebp)
    12ab:	ff 45 fc             	incl   -0x4(%ebp)
    12ae:	eb 28                	jmp    12d8 <hex2Str+0x70>
    12b0:	8b 45 08             	mov    0x8(%ebp),%eax
    12b3:	c1 e8 04             	shr    $0x4,%eax
    12b6:	89 45 f8             	mov    %eax,-0x8(%ebp)
    12b9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    12bc:	c1 e0 04             	shl    $0x4,%eax
    12bf:	89 c2                	mov    %eax,%edx
    12c1:	8b 45 08             	mov    0x8(%ebp),%eax
    12c4:	29 d0                	sub    %edx,%eax
    12c6:	89 c2                	mov    %eax,%edx
    12c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12cb:	89 54 85 b8          	mov    %edx,-0x48(%ebp,%eax,4)
    12cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    12d2:	89 45 08             	mov    %eax,0x8(%ebp)
    12d5:	ff 45 fc             	incl   -0x4(%ebp)
    12d8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    12dc:	75 d2                	jne    12b0 <hex2Str+0x48>
    12de:	eb 6a                	jmp    134a <hex2Str+0xe2>
    12e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12e3:	48                   	dec    %eax
    12e4:	8b 44 85 b8          	mov    -0x48(%ebp,%eax,4),%eax
    12e8:	83 f8 09             	cmp    $0x9,%eax
    12eb:	7f 19                	jg     1306 <hex2Str+0x9e>
    12ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12f0:	48                   	dec    %eax
    12f1:	8b 44 85 b8          	mov    -0x48(%ebp,%eax,4),%eax
    12f5:	8d 48 30             	lea    0x30(%eax),%ecx
    12f8:	8b 55 14             	mov    0x14(%ebp),%edx
    12fb:	8b 45 0c             	mov    0xc(%ebp),%eax
    12fe:	01 d0                	add    %edx,%eax
    1300:	88 ca                	mov    %cl,%dl
    1302:	88 10                	mov    %dl,(%eax)
    1304:	eb 17                	jmp    131d <hex2Str+0xb5>
    1306:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1309:	48                   	dec    %eax
    130a:	8b 44 85 b8          	mov    -0x48(%ebp,%eax,4),%eax
    130e:	8d 48 57             	lea    0x57(%eax),%ecx
    1311:	8b 55 14             	mov    0x14(%ebp),%edx
    1314:	8b 45 0c             	mov    0xc(%ebp),%eax
    1317:	01 d0                	add    %edx,%eax
    1319:	88 ca                	mov    %cl,%dl
    131b:	88 10                	mov    %dl,(%eax)
    131d:	ff 45 14             	incl   0x14(%ebp)
    1320:	8b 45 14             	mov    0x14(%ebp),%eax
    1323:	3b 45 10             	cmp    0x10(%ebp),%eax
    1326:	75 1f                	jne    1347 <hex2Str+0xdf>
    1328:	8b 55 10             	mov    0x10(%ebp),%edx
    132b:	8b 45 0c             	mov    0xc(%ebp),%eax
    132e:	6a 00                	push   $0x0
    1330:	6a 00                	push   $0x0
    1332:	52                   	push   %edx
    1333:	50                   	push   %eax
    1334:	6a 00                	push   $0x0
    1336:	6a 00                	push   $0x0
    1338:	e8 c7 fa ff ff       	call   e04 <syscall>
    133d:	83 c4 18             	add    $0x18,%esp
    1340:	c7 45 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
    1347:	ff 4d fc             	decl   -0x4(%ebp)
    134a:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
    134e:	75 90                	jne    12e0 <hex2Str+0x78>
    1350:	8b 45 14             	mov    0x14(%ebp),%eax
    1353:	c9                   	leave  
    1354:	c3                   	ret    

00001355 <str2Str>:
    1355:	55                   	push   %ebp
    1356:	89 e5                	mov    %esp,%ebp
    1358:	83 ec 10             	sub    $0x10,%esp
    135b:	e8 9c fa ff ff       	call   dfc <__x86.get_pc_thunk.ax>
    1360:	05 a0 1c 00 00       	add    $0x1ca0,%eax
    1365:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    136c:	eb 41                	jmp    13af <str2Str+0x5a>
    136e:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1371:	8b 45 08             	mov    0x8(%ebp),%eax
    1374:	01 d0                	add    %edx,%eax
    1376:	8b 4d 14             	mov    0x14(%ebp),%ecx
    1379:	8b 55 0c             	mov    0xc(%ebp),%edx
    137c:	01 ca                	add    %ecx,%edx
    137e:	8a 00                	mov    (%eax),%al
    1380:	88 02                	mov    %al,(%edx)
    1382:	ff 45 14             	incl   0x14(%ebp)
    1385:	8b 45 14             	mov    0x14(%ebp),%eax
    1388:	3b 45 10             	cmp    0x10(%ebp),%eax
    138b:	75 1f                	jne    13ac <str2Str+0x57>
    138d:	8b 55 10             	mov    0x10(%ebp),%edx
    1390:	8b 45 0c             	mov    0xc(%ebp),%eax
    1393:	6a 00                	push   $0x0
    1395:	6a 00                	push   $0x0
    1397:	52                   	push   %edx
    1398:	50                   	push   %eax
    1399:	6a 00                	push   $0x0
    139b:	6a 00                	push   $0x0
    139d:	e8 62 fa ff ff       	call   e04 <syscall>
    13a2:	83 c4 18             	add    $0x18,%esp
    13a5:	c7 45 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
    13ac:	ff 45 fc             	incl   -0x4(%ebp)
    13af:	8b 55 fc             	mov    -0x4(%ebp),%edx
    13b2:	8b 45 08             	mov    0x8(%ebp),%eax
    13b5:	01 d0                	add    %edx,%eax
    13b7:	8a 00                	mov    (%eax),%al
    13b9:	84 c0                	test   %al,%al
    13bb:	75 b1                	jne    136e <str2Str+0x19>
    13bd:	8b 45 14             	mov    0x14(%ebp),%eax
    13c0:	c9                   	leave  
    13c1:	c3                   	ret    

000013c2 <fork>:
    13c2:	55                   	push   %ebp
    13c3:	89 e5                	mov    %esp,%ebp
    13c5:	e8 32 fa ff ff       	call   dfc <__x86.get_pc_thunk.ax>
    13ca:	05 36 1c 00 00       	add    $0x1c36,%eax
    13cf:	6a 00                	push   $0x0
    13d1:	6a 00                	push   $0x0
    13d3:	6a 00                	push   $0x0
    13d5:	6a 00                	push   $0x0
    13d7:	6a 00                	push   $0x0
    13d9:	6a 01                	push   $0x1
    13db:	e8 24 fa ff ff       	call   e04 <syscall>
    13e0:	83 c4 18             	add    $0x18,%esp
    13e3:	c9                   	leave  
    13e4:	c3                   	ret    

000013e5 <exec>:
    13e5:	55                   	push   %ebp
    13e6:	89 e5                	mov    %esp,%ebp
    13e8:	e8 0f fa ff ff       	call   dfc <__x86.get_pc_thunk.ax>
    13ed:	05 13 1c 00 00       	add    $0x1c13,%eax
    13f2:	8b 45 08             	mov    0x8(%ebp),%eax
    13f5:	6a 00                	push   $0x0
    13f7:	6a 00                	push   $0x0
    13f9:	6a 00                	push   $0x0
    13fb:	6a 00                	push   $0x0
    13fd:	50                   	push   %eax
    13fe:	6a 02                	push   $0x2
    1400:	e8 ff f9 ff ff       	call   e04 <syscall>
    1405:	83 c4 18             	add    $0x18,%esp
    1408:	c9                   	leave  
    1409:	c3                   	ret    

0000140a <sleep>:
    140a:	55                   	push   %ebp
    140b:	89 e5                	mov    %esp,%ebp
    140d:	e8 ea f9 ff ff       	call   dfc <__x86.get_pc_thunk.ax>
    1412:	05 ee 1b 00 00       	add    $0x1bee,%eax
    1417:	6a 00                	push   $0x0
    1419:	6a 00                	push   $0x0
    141b:	6a 00                	push   $0x0
    141d:	6a 00                	push   $0x0
    141f:	ff 75 08             	pushl  0x8(%ebp)
    1422:	6a 03                	push   $0x3
    1424:	e8 db f9 ff ff       	call   e04 <syscall>
    1429:	83 c4 18             	add    $0x18,%esp
    142c:	c9                   	leave  
    142d:	c3                   	ret    

0000142e <exit>:
    142e:	55                   	push   %ebp
    142f:	89 e5                	mov    %esp,%ebp
    1431:	e8 c6 f9 ff ff       	call   dfc <__x86.get_pc_thunk.ax>
    1436:	05 ca 1b 00 00       	add    $0x1bca,%eax
    143b:	6a 00                	push   $0x0
    143d:	6a 00                	push   $0x0
    143f:	6a 00                	push   $0x0
    1441:	6a 00                	push   $0x0
    1443:	6a 00                	push   $0x0
    1445:	6a 04                	push   $0x4
    1447:	e8 b8 f9 ff ff       	call   e04 <syscall>
    144c:	83 c4 18             	add    $0x18,%esp
    144f:	c9                   	leave  
    1450:	c3                   	ret    
