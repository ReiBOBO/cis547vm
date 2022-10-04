; ModuleID = 'test5.c'
source_filename = "test5.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.declare(metadata i32* %j, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 0, i32* %j, align 4, !dbg !14
  call void @llvm.dbg.declare(metadata i32* %x, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 0, i32* %x, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata i32* %y, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 2, i32* %y, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata i32* %z, metadata !19, metadata !DIExpression()), !dbg !20
  br label %while.cond, !dbg !21

while.cond:                                       ; preds = %if.end5, %entry
  %call = call i32 @getchar(), !dbg !22
  store i32 %call, i32* %i, align 4, !dbg !23
  %sub = sub nsw i32 %call, 48, !dbg !24
  %cmp = icmp sge i32 %sub, 0, !dbg !25
  br i1 %cmp, label %while.body, label %while.end, !dbg !21

while.body:                                       ; preds = %while.cond
  %0 = load i32, i32* %i, align 4, !dbg !26
  %cmp1 = icmp eq i32 %0, 121, !dbg !29
  br i1 %cmp1, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %while.body
  store i32 1, i32* %j, align 4, !dbg !31
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %while.body
  %1 = load i32, i32* %j, align 4, !dbg !34
  %cmp2 = icmp eq i32 %1, 1, !dbg !36
  br i1 %cmp2, label %land.lhs.true, label %if.end5, !dbg !37

land.lhs.true:                                    ; preds = %if.end
  %2 = load i32, i32* %i, align 4, !dbg !38
  %cmp3 = icmp eq i32 %2, 120, !dbg !39
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !40

if.then4:                                         ; preds = %land.lhs.true
  %3 = load i32, i32* %y, align 4, !dbg !41
  %4 = load i32, i32* %x, align 4, !dbg !43
  %div = sdiv i32 %3, %4, !dbg !44
  store i32 %div, i32* %z, align 4, !dbg !45
  br label %if.end5, !dbg !46

if.end5:                                          ; preds = %if.then4, %land.lhs.true, %if.end
  br label %while.cond, !dbg !21, !llvm.loop !47

while.end:                                        ; preds = %while.cond
  ret i32 0, !dbg !49
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @getchar() #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 8.0.1- (branches/release_80)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "test5.c", directory: "/lab4/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 8.0.1- (branches/release_80)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 5, type: !10)
!12 = !DILocation(line: 5, column: 7, scope: !7)
!13 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 6, type: !10)
!14 = !DILocation(line: 6, column: 7, scope: !7)
!15 = !DILocalVariable(name: "x", scope: !7, file: !1, line: 7, type: !10)
!16 = !DILocation(line: 7, column: 7, scope: !7)
!17 = !DILocalVariable(name: "y", scope: !7, file: !1, line: 8, type: !10)
!18 = !DILocation(line: 8, column: 7, scope: !7)
!19 = !DILocalVariable(name: "z", scope: !7, file: !1, line: 9, type: !10)
!20 = !DILocation(line: 9, column: 6, scope: !7)
!21 = !DILocation(line: 10, column: 2, scope: !7)
!22 = !DILocation(line: 10, column: 14, scope: !7)
!23 = !DILocation(line: 10, column: 12, scope: !7)
!24 = !DILocation(line: 10, column: 25, scope: !7)
!25 = !DILocation(line: 10, column: 31, scope: !7)
!26 = !DILocation(line: 11, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !1, line: 11, column: 9)
!28 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 37)
!29 = !DILocation(line: 11, column: 11, scope: !27)
!30 = !DILocation(line: 11, column: 9, scope: !28)
!31 = !DILocation(line: 12, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !1, line: 11, column: 19)
!33 = !DILocation(line: 13, column: 3, scope: !32)
!34 = !DILocation(line: 14, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !1, line: 14, column: 9)
!36 = !DILocation(line: 14, column: 11, scope: !35)
!37 = !DILocation(line: 14, column: 16, scope: !35)
!38 = !DILocation(line: 14, column: 19, scope: !35)
!39 = !DILocation(line: 14, column: 21, scope: !35)
!40 = !DILocation(line: 14, column: 9, scope: !28)
!41 = !DILocation(line: 15, column: 11, scope: !42)
!42 = distinct !DILexicalBlock(scope: !35, file: !1, line: 14, column: 29)
!43 = !DILocation(line: 15, column: 15, scope: !42)
!44 = !DILocation(line: 15, column: 13, scope: !42)
!45 = !DILocation(line: 15, column: 9, scope: !42)
!46 = !DILocation(line: 16, column: 5, scope: !42)
!47 = distinct !{!47, !21, !48}
!48 = !DILocation(line: 17, column: 3, scope: !7)
!49 = !DILocation(line: 18, column: 3, scope: !7)
