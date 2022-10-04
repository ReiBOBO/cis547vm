; ModuleID = 'test6.c'
source_filename = "test6.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct._json_value = type { %struct._json_value*, i32, %union.anon, %union.anon.2 }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i8* }
%union.anon.2 = type { %struct._json_value* }
%struct.json_settings = type { i64, i32, i8* (i64, i32, i8*)*, void (i8*, i8*)*, i8*, i64 }
%struct.json_state = type { i64, i32, i64, %struct.json_settings, i32, i8*, i32, i32 }
%struct.anon.0 = type { i32, %struct._json_object_entry* }
%struct._json_object_entry = type { i8*, i32, %struct._json_value* }
%struct.anon.1 = type { i32, %struct._json_value** }

@.str = private unnamed_addr constant [18 x i8] c"THIS IS A BUG! %d\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"Unexpected EOF in string (at %d:%d)\00", align 1
@.str.2 = private unnamed_addr constant [40 x i8] c"Invalid character value `%c` (at %d:%d)\00", align 1
@.str.3 = private unnamed_addr constant [39 x i8] c"%d:%d: Unexpected EOF in block comment\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"%d:%d: Comment not allowed here\00", align 1
@.str.5 = private unnamed_addr constant [22 x i8] c"%d:%d: EOF unexpected\00", align 1
@.str.6 = private unnamed_addr constant [51 x i8] c"%d:%d: Unexpected `%c` in comment opening sequence\00", align 1
@.str.7 = private unnamed_addr constant [30 x i8] c"%d:%d: Trailing garbage: `%c`\00", align 1
@.str.8 = private unnamed_addr constant [20 x i8] c"%d:%d: Unexpected ]\00", align 1
@.str.9 = private unnamed_addr constant [28 x i8] c"%d:%d: Expected , before %c\00", align 1
@.str.10 = private unnamed_addr constant [28 x i8] c"%d:%d: Expected : before %c\00", align 1
@.str.11 = private unnamed_addr constant [40 x i8] c"%d:%d: Unexpected %c when seeking value\00", align 1
@.str.12 = private unnamed_addr constant [27 x i8] c"%d:%d: Expected , before \22\00", align 1
@.str.13 = private unnamed_addr constant [33 x i8] c"%d:%d: Unexpected `%c` in object\00", align 1
@.str.14 = private unnamed_addr constant [34 x i8] c"%d:%d: Unexpected `0` before `%c`\00", align 1
@.str.15 = private unnamed_addr constant [33 x i8] c"%d:%d: Expected digit before `.`\00", align 1
@.str.16 = private unnamed_addr constant [32 x i8] c"%d:%d: Expected digit after `.`\00", align 1
@.str.17 = private unnamed_addr constant [32 x i8] c"%d:%d: Expected digit after `e`\00", align 1
@.str.18 = private unnamed_addr constant [21 x i8] c"%d:%d: Unknown value\00", align 1
@.str.19 = private unnamed_addr constant [26 x i8] c"Memory allocation failure\00", align 1
@.str.20 = private unnamed_addr constant [34 x i8] c"%d:%d: Too long (caught overflow)\00", align 1
@.str.21 = private unnamed_addr constant [14 x i8] c"Unknown error\00", align 1
@stdin = external dso_local global %struct._IO_FILE*, align 8
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.22 = private unnamed_addr constant [22 x i8] c"Unable to parse data\0A\00", align 1
@json_value_none = common dso_local global %struct._json_value zeroinitializer, align 8, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct._json_value* @json_parse_ex(%struct.json_settings* %settings, i8* %json, i64 %length, i8* %error_buf) #0 !dbg !128 {
entry:
  %retval = alloca %struct._json_value*, align 8
  %settings.addr = alloca %struct.json_settings*, align 8
  %json.addr = alloca i8*, align 8
  %length.addr = alloca i64, align 8
  %error_buf.addr = alloca i8*, align 8
  %error = alloca [128 x i8], align 16
  %end = alloca i8*, align 8
  %top = alloca %struct._json_value*, align 8
  %root = alloca %struct._json_value*, align 8
  %alloc = alloca %struct._json_value*, align 8
  %state = alloca %struct.json_state, align 8
  %flags = alloca i32, align 4
  %num_digits = alloca double, align 8
  %num_e = alloca double, align 8
  %num_fraction = alloca double, align 8
  %ZERO = alloca i32, align 4
  %uchar = alloca i32, align 4
  %uc_b1 = alloca i8, align 1
  %uc_b2 = alloca i8, align 1
  %uc_b3 = alloca i8, align 1
  %uc_b4 = alloca i8, align 1
  %string = alloca i8*, align 8
  %string_length = alloca i32, align 4
  %b = alloca i8, align 1
  %uchar2 = alloca i32, align 4
  %parent1169 = alloca %struct._json_value*, align 8
  store %struct.json_settings* %settings, %struct.json_settings** %settings.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.json_settings** %settings.addr, metadata !152, metadata !DIExpression()), !dbg !153
  store i8* %json, i8** %json.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %json.addr, metadata !154, metadata !DIExpression()), !dbg !155
  store i64 %length, i64* %length.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %length.addr, metadata !156, metadata !DIExpression()), !dbg !157
  store i8* %error_buf, i8** %error_buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %error_buf.addr, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata [128 x i8]* %error, metadata !160, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata i8** %end, metadata !165, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.declare(metadata %struct._json_value** %top, metadata !167, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata %struct._json_value** %root, metadata !169, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.declare(metadata %struct._json_value** %alloc, metadata !171, metadata !DIExpression()), !dbg !172
  store %struct._json_value* null, %struct._json_value** %alloc, align 8, !dbg !172
  call void @llvm.dbg.declare(metadata %struct.json_state* %state, metadata !173, metadata !DIExpression()), !dbg !185
  %0 = bitcast %struct.json_state* %state to i8*, !dbg !185
  call void @llvm.memset.p0i8.i64(i8* align 8 %0, i8 0, i64 96, i1 false), !dbg !185
  call void @llvm.dbg.declare(metadata i32* %flags, metadata !186, metadata !DIExpression()), !dbg !187
  store i32 0, i32* %flags, align 4, !dbg !187
  call void @llvm.dbg.declare(metadata double* %num_digits, metadata !188, metadata !DIExpression()), !dbg !189
  store double 0.000000e+00, double* %num_digits, align 8, !dbg !189
  call void @llvm.dbg.declare(metadata double* %num_e, metadata !190, metadata !DIExpression()), !dbg !191
  store double 0.000000e+00, double* %num_e, align 8, !dbg !191
  call void @llvm.dbg.declare(metadata double* %num_fraction, metadata !192, metadata !DIExpression()), !dbg !193
  store double 0.000000e+00, double* %num_fraction, align 8, !dbg !193
  call void @llvm.dbg.declare(metadata i32* %ZERO, metadata !194, metadata !DIExpression()), !dbg !195
  %1 = load i32, i32* %flags, align 4, !dbg !196
  store i32 %1, i32* %ZERO, align 4, !dbg !195
  %2 = load i64, i64* %length.addr, align 8, !dbg !197
  %cmp = icmp uge i64 %2, 3, !dbg !199
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !200

land.lhs.true:                                    ; preds = %entry
  %3 = load i8*, i8** %json.addr, align 8, !dbg !201
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !201
  %4 = load i8, i8* %arrayidx, align 1, !dbg !201
  %conv = zext i8 %4 to i32, !dbg !202
  %cmp1 = icmp eq i32 %conv, 239, !dbg !203
  br i1 %cmp1, label %land.lhs.true3, label %if.end, !dbg !204

land.lhs.true3:                                   ; preds = %land.lhs.true
  %5 = load i8*, i8** %json.addr, align 8, !dbg !205
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 1, !dbg !205
  %6 = load i8, i8* %arrayidx4, align 1, !dbg !205
  %conv5 = zext i8 %6 to i32, !dbg !206
  %cmp6 = icmp eq i32 %conv5, 187, !dbg !207
  br i1 %cmp6, label %land.lhs.true8, label %if.end, !dbg !208

land.lhs.true8:                                   ; preds = %land.lhs.true3
  %7 = load i8*, i8** %json.addr, align 8, !dbg !209
  %arrayidx9 = getelementptr inbounds i8, i8* %7, i64 2, !dbg !209
  %8 = load i8, i8* %arrayidx9, align 1, !dbg !209
  %conv10 = zext i8 %8 to i32, !dbg !210
  %cmp11 = icmp eq i32 %conv10, 191, !dbg !211
  br i1 %cmp11, label %if.then, label %if.end, !dbg !212

if.then:                                          ; preds = %land.lhs.true8
  %9 = load i8*, i8** %json.addr, align 8, !dbg !213
  %add.ptr = getelementptr inbounds i8, i8* %9, i64 3, !dbg !213
  store i8* %add.ptr, i8** %json.addr, align 8, !dbg !213
  %10 = load i64, i64* %length.addr, align 8, !dbg !215
  %sub = sub i64 %10, 3, !dbg !215
  store i64 %sub, i64* %length.addr, align 8, !dbg !215
  br label %if.end, !dbg !216

if.end:                                           ; preds = %if.then, %land.lhs.true8, %land.lhs.true3, %land.lhs.true, %entry
  %arrayidx13 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !217
  store i8 0, i8* %arrayidx13, align 16, !dbg !218
  %11 = load i8*, i8** %json.addr, align 8, !dbg !219
  %12 = load i64, i64* %length.addr, align 8, !dbg !220
  %add.ptr14 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !221
  store i8* %add.ptr14, i8** %end, align 8, !dbg !222
  %settings15 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !223
  %13 = bitcast %struct.json_settings* %settings15 to i8*, !dbg !224
  %14 = load %struct.json_settings*, %struct.json_settings** %settings.addr, align 8, !dbg !225
  %15 = bitcast %struct.json_settings* %14 to i8*, !dbg !224
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %13, i8* align 8 %15, i64 48, i1 false), !dbg !224
  %settings16 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !226
  %mem_alloc = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings16, i32 0, i32 2, !dbg !228
  %16 = load i8* (i64, i32, i8*)*, i8* (i64, i32, i8*)** %mem_alloc, align 8, !dbg !228
  %tobool = icmp ne i8* (i64, i32, i8*)* %16, null, !dbg !229
  br i1 %tobool, label %if.end20, label %if.then17, !dbg !230

if.then17:                                        ; preds = %if.end
  %settings18 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !231
  %mem_alloc19 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings18, i32 0, i32 2, !dbg !232
  store i8* (i64, i32, i8*)* @default_alloc, i8* (i64, i32, i8*)** %mem_alloc19, align 8, !dbg !233
  br label %if.end20, !dbg !234

if.end20:                                         ; preds = %if.then17, %if.end
  %settings21 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !235
  %mem_free = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings21, i32 0, i32 3, !dbg !237
  %17 = load void (i8*, i8*)*, void (i8*, i8*)** %mem_free, align 8, !dbg !237
  %tobool22 = icmp ne void (i8*, i8*)* %17, null, !dbg !238
  br i1 %tobool22, label %if.end26, label %if.then23, !dbg !239

if.then23:                                        ; preds = %if.end20
  %settings24 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !240
  %mem_free25 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings24, i32 0, i32 3, !dbg !241
  store void (i8*, i8*)* @default_free, void (i8*, i8*)** %mem_free25, align 8, !dbg !242
  br label %if.end26, !dbg !243

if.end26:                                         ; preds = %if.then23, %if.end20
  %uint_max = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 1, !dbg !244
  %18 = bitcast i32* %uint_max to i8*, !dbg !245
  call void @llvm.memset.p0i8.i64(i8* align 8 %18, i8 -1, i64 4, i1 false), !dbg !245
  %ulong_max = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !246
  %19 = bitcast i64* %ulong_max to i8*, !dbg !247
  call void @llvm.memset.p0i8.i64(i8* align 8 %19, i8 -1, i64 8, i1 false), !dbg !247
  %uint_max27 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 1, !dbg !248
  %20 = load i32, i32* %uint_max27, align 8, !dbg !249
  %sub28 = sub i32 %20, 8, !dbg !249
  store i32 %sub28, i32* %uint_max27, align 8, !dbg !249
  %ulong_max29 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !250
  %21 = load i64, i64* %ulong_max29, align 8, !dbg !251
  %sub30 = sub i64 %21, 8, !dbg !251
  store i64 %sub30, i64* %ulong_max29, align 8, !dbg !251
  %first_pass = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !252
  store i32 1, i32* %first_pass, align 8, !dbg !254
  br label %for.cond, !dbg !255

for.cond:                                         ; preds = %for.inc1206, %if.end26
  %first_pass31 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !256
  %22 = load i32, i32* %first_pass31, align 8, !dbg !256
  %cmp32 = icmp sge i32 %22, 0, !dbg !258
  br i1 %cmp32, label %for.body, label %for.end1208, !dbg !259

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %uchar, metadata !260, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.declare(metadata i8* %uc_b1, metadata !264, metadata !DIExpression()), !dbg !265
  call void @llvm.dbg.declare(metadata i8* %uc_b2, metadata !266, metadata !DIExpression()), !dbg !267
  call void @llvm.dbg.declare(metadata i8* %uc_b3, metadata !268, metadata !DIExpression()), !dbg !269
  call void @llvm.dbg.declare(metadata i8* %uc_b4, metadata !270, metadata !DIExpression()), !dbg !271
  call void @llvm.dbg.declare(metadata i8** %string, metadata !272, metadata !DIExpression()), !dbg !273
  store i8* null, i8** %string, align 8, !dbg !273
  call void @llvm.dbg.declare(metadata i32* %string_length, metadata !274, metadata !DIExpression()), !dbg !275
  store i32 0, i32* %string_length, align 4, !dbg !275
  store %struct._json_value* null, %struct._json_value** %root, align 8, !dbg !276
  store %struct._json_value* null, %struct._json_value** %top, align 8, !dbg !277
  store i32 8, i32* %flags, align 4, !dbg !278
  %cur_line = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !279
  store i32 1, i32* %cur_line, align 8, !dbg !280
  %23 = load i8*, i8** %json.addr, align 8, !dbg !281
  %ptr = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !283
  store i8* %23, i8** %ptr, align 8, !dbg !284
  br label %for.cond34, !dbg !285

for.cond34:                                       ; preds = %for.inc, %for.body
  call void @llvm.dbg.declare(metadata i8* %b, metadata !286, metadata !DIExpression()), !dbg !289
  %ptr35 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !290
  %24 = load i8*, i8** %ptr35, align 8, !dbg !290
  %25 = load i8*, i8** %end, align 8, !dbg !291
  %cmp36 = icmp eq i8* %24, %25, !dbg !292
  br i1 %cmp36, label %cond.true, label %cond.false, !dbg !293

cond.true:                                        ; preds = %for.cond34
  br label %cond.end, !dbg !293

cond.false:                                       ; preds = %for.cond34
  %ptr38 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !294
  %26 = load i8*, i8** %ptr38, align 8, !dbg !294
  %27 = load i8, i8* %26, align 1, !dbg !295
  %conv39 = sext i8 %27 to i32, !dbg !295
  br label %cond.end, !dbg !293

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %conv39, %cond.false ], !dbg !293
  %conv40 = trunc i32 %cond to i8, !dbg !296
  store i8 %conv40, i8* %b, align 1, !dbg !289
  %28 = load i8, i8* %b, align 1, !dbg !297
  %conv41 = sext i8 %28 to i32, !dbg !297
  %cmp42 = icmp eq i32 %conv41, 122, !dbg !299
  br i1 %cmp42, label %if.then44, label %if.end46, !dbg !300

if.then44:                                        ; preds = %cond.end
  %29 = load i8, i8* %b, align 1, !dbg !301
  %conv45 = sext i8 %29 to i32, !dbg !301
  %30 = load i32, i32* %ZERO, align 4, !dbg !302
  %div = sdiv i32 %conv45, %30, !dbg !303
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i32 0, i32 0), i32 %div), !dbg !304
  br label %if.end46, !dbg !304

if.end46:                                         ; preds = %if.then44, %cond.end
  %31 = load i32, i32* %flags, align 4, !dbg !305
  %conv47 = sext i32 %31 to i64, !dbg !305
  %and = and i64 %conv47, 32, !dbg !307
  %tobool48 = icmp ne i64 %and, 0, !dbg !307
  br i1 %tobool48, label %if.then49, label %if.end416, !dbg !308

if.then49:                                        ; preds = %if.end46
  %32 = load i8, i8* %b, align 1, !dbg !309
  %tobool50 = icmp ne i8 %32, 0, !dbg !309
  br i1 %tobool50, label %if.end54, label %if.then51, !dbg !312

if.then51:                                        ; preds = %if.then49
  %arraydecay = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !313
  %cur_line52 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !315
  %33 = load i32, i32* %cur_line52, align 8, !dbg !315
  %cur_col = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !315
  %34 = load i32, i32* %cur_col, align 4, !dbg !315
  %call53 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i32 0, i32 0), i32 %33, i32 %34) #8, !dbg !316
  br label %e_failed, !dbg !317

if.end54:                                         ; preds = %if.then49
  %35 = load i32, i32* %string_length, align 4, !dbg !318
  %uint_max55 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 1, !dbg !320
  %36 = load i32, i32* %uint_max55, align 8, !dbg !320
  %cmp56 = icmp ugt i32 %35, %36, !dbg !321
  br i1 %cmp56, label %if.then58, label %if.end59, !dbg !322

if.then58:                                        ; preds = %if.end54
  br label %e_overflow, !dbg !323

if.end59:                                         ; preds = %if.end54
  %37 = load i32, i32* %flags, align 4, !dbg !324
  %conv60 = sext i32 %37 to i64, !dbg !324
  %and61 = and i64 %conv60, 16, !dbg !326
  %tobool62 = icmp ne i64 %and61, 0, !dbg !326
  br i1 %tobool62, label %if.then63, label %if.end342, !dbg !327

if.then63:                                        ; preds = %if.end59
  %38 = load i32, i32* %flags, align 4, !dbg !328
  %conv64 = sext i32 %38 to i64, !dbg !328
  %and65 = and i64 %conv64, -17, !dbg !328
  %conv66 = trunc i64 %and65 to i32, !dbg !328
  store i32 %conv66, i32* %flags, align 4, !dbg !328
  %39 = load i8, i8* %b, align 1, !dbg !330
  %conv67 = sext i8 %39 to i32, !dbg !330
  switch i32 %conv67, label %sw.default [
    i32 98, label %sw.bb
    i32 102, label %sw.bb73
    i32 110, label %sw.bb83
    i32 114, label %sw.bb93
    i32 116, label %sw.bb103
    i32 117, label %sw.bb113
  ], !dbg !331

sw.bb:                                            ; preds = %if.then63
  br label %do.body, !dbg !332

do.body:                                          ; preds = %sw.bb
  %first_pass68 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !334
  %40 = load i32, i32* %first_pass68, align 8, !dbg !334
  %tobool69 = icmp ne i32 %40, 0, !dbg !334
  br i1 %tobool69, label %if.end72, label %if.then70, !dbg !337

if.then70:                                        ; preds = %do.body
  %41 = load i8*, i8** %string, align 8, !dbg !334
  %42 = load i32, i32* %string_length, align 4, !dbg !334
  %idxprom = zext i32 %42 to i64, !dbg !334
  %arrayidx71 = getelementptr inbounds i8, i8* %41, i64 %idxprom, !dbg !334
  store i8 8, i8* %arrayidx71, align 1, !dbg !334
  br label %if.end72, !dbg !334

if.end72:                                         ; preds = %if.then70, %do.body
  %43 = load i32, i32* %string_length, align 4, !dbg !337
  %inc = add i32 %43, 1, !dbg !337
  store i32 %inc, i32* %string_length, align 4, !dbg !337
  br label %do.end, !dbg !337

do.end:                                           ; preds = %if.end72
  br label %sw.epilog, !dbg !338

sw.bb73:                                          ; preds = %if.then63
  br label %do.body74, !dbg !339

do.body74:                                        ; preds = %sw.bb73
  %first_pass75 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !340
  %44 = load i32, i32* %first_pass75, align 8, !dbg !340
  %tobool76 = icmp ne i32 %44, 0, !dbg !340
  br i1 %tobool76, label %if.end80, label %if.then77, !dbg !343

if.then77:                                        ; preds = %do.body74
  %45 = load i8*, i8** %string, align 8, !dbg !340
  %46 = load i32, i32* %string_length, align 4, !dbg !340
  %idxprom78 = zext i32 %46 to i64, !dbg !340
  %arrayidx79 = getelementptr inbounds i8, i8* %45, i64 %idxprom78, !dbg !340
  store i8 12, i8* %arrayidx79, align 1, !dbg !340
  br label %if.end80, !dbg !340

if.end80:                                         ; preds = %if.then77, %do.body74
  %47 = load i32, i32* %string_length, align 4, !dbg !343
  %inc81 = add i32 %47, 1, !dbg !343
  store i32 %inc81, i32* %string_length, align 4, !dbg !343
  br label %do.end82, !dbg !343

do.end82:                                         ; preds = %if.end80
  br label %sw.epilog, !dbg !344

sw.bb83:                                          ; preds = %if.then63
  br label %do.body84, !dbg !345

do.body84:                                        ; preds = %sw.bb83
  %first_pass85 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !346
  %48 = load i32, i32* %first_pass85, align 8, !dbg !346
  %tobool86 = icmp ne i32 %48, 0, !dbg !346
  br i1 %tobool86, label %if.end90, label %if.then87, !dbg !349

if.then87:                                        ; preds = %do.body84
  %49 = load i8*, i8** %string, align 8, !dbg !346
  %50 = load i32, i32* %string_length, align 4, !dbg !346
  %idxprom88 = zext i32 %50 to i64, !dbg !346
  %arrayidx89 = getelementptr inbounds i8, i8* %49, i64 %idxprom88, !dbg !346
  store i8 10, i8* %arrayidx89, align 1, !dbg !346
  br label %if.end90, !dbg !346

if.end90:                                         ; preds = %if.then87, %do.body84
  %51 = load i32, i32* %string_length, align 4, !dbg !349
  %inc91 = add i32 %51, 1, !dbg !349
  store i32 %inc91, i32* %string_length, align 4, !dbg !349
  br label %do.end92, !dbg !349

do.end92:                                         ; preds = %if.end90
  br label %sw.epilog, !dbg !350

sw.bb93:                                          ; preds = %if.then63
  br label %do.body94, !dbg !351

do.body94:                                        ; preds = %sw.bb93
  %first_pass95 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !352
  %52 = load i32, i32* %first_pass95, align 8, !dbg !352
  %tobool96 = icmp ne i32 %52, 0, !dbg !352
  br i1 %tobool96, label %if.end100, label %if.then97, !dbg !355

if.then97:                                        ; preds = %do.body94
  %53 = load i8*, i8** %string, align 8, !dbg !352
  %54 = load i32, i32* %string_length, align 4, !dbg !352
  %idxprom98 = zext i32 %54 to i64, !dbg !352
  %arrayidx99 = getelementptr inbounds i8, i8* %53, i64 %idxprom98, !dbg !352
  store i8 13, i8* %arrayidx99, align 1, !dbg !352
  br label %if.end100, !dbg !352

if.end100:                                        ; preds = %if.then97, %do.body94
  %55 = load i32, i32* %string_length, align 4, !dbg !355
  %inc101 = add i32 %55, 1, !dbg !355
  store i32 %inc101, i32* %string_length, align 4, !dbg !355
  br label %do.end102, !dbg !355

do.end102:                                        ; preds = %if.end100
  br label %sw.epilog, !dbg !356

sw.bb103:                                         ; preds = %if.then63
  br label %do.body104, !dbg !357

do.body104:                                       ; preds = %sw.bb103
  %first_pass105 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !358
  %56 = load i32, i32* %first_pass105, align 8, !dbg !358
  %tobool106 = icmp ne i32 %56, 0, !dbg !358
  br i1 %tobool106, label %if.end110, label %if.then107, !dbg !361

if.then107:                                       ; preds = %do.body104
  %57 = load i8*, i8** %string, align 8, !dbg !358
  %58 = load i32, i32* %string_length, align 4, !dbg !358
  %idxprom108 = zext i32 %58 to i64, !dbg !358
  %arrayidx109 = getelementptr inbounds i8, i8* %57, i64 %idxprom108, !dbg !358
  store i8 9, i8* %arrayidx109, align 1, !dbg !358
  br label %if.end110, !dbg !358

if.end110:                                        ; preds = %if.then107, %do.body104
  %59 = load i32, i32* %string_length, align 4, !dbg !361
  %inc111 = add i32 %59, 1, !dbg !361
  store i32 %inc111, i32* %string_length, align 4, !dbg !361
  br label %do.end112, !dbg !361

do.end112:                                        ; preds = %if.end110
  br label %sw.epilog, !dbg !362

sw.bb113:                                         ; preds = %if.then63
  %60 = load i8*, i8** %end, align 8, !dbg !363
  %ptr114 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !365
  %61 = load i8*, i8** %ptr114, align 8, !dbg !365
  %sub.ptr.lhs.cast = ptrtoint i8* %60 to i64, !dbg !366
  %sub.ptr.rhs.cast = ptrtoint i8* %61 to i64, !dbg !366
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !366
  %cmp115 = icmp sle i64 %sub.ptr.sub, 4, !dbg !367
  br i1 %cmp115, label %if.then143, label %lor.lhs.false, !dbg !368

lor.lhs.false:                                    ; preds = %sw.bb113
  %ptr117 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !369
  %62 = load i8*, i8** %ptr117, align 8, !dbg !370
  %incdec.ptr = getelementptr inbounds i8, i8* %62, i32 1, !dbg !370
  store i8* %incdec.ptr, i8** %ptr117, align 8, !dbg !370
  %63 = load i8, i8* %incdec.ptr, align 1, !dbg !371
  %call118 = call zeroext i8 @hex_value(i8 signext %63), !dbg !372
  store i8 %call118, i8* %uc_b1, align 1, !dbg !373
  %conv119 = zext i8 %call118 to i32, !dbg !374
  %cmp120 = icmp eq i32 %conv119, 255, !dbg !375
  br i1 %cmp120, label %if.then143, label %lor.lhs.false122, !dbg !376

lor.lhs.false122:                                 ; preds = %lor.lhs.false
  %ptr123 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !377
  %64 = load i8*, i8** %ptr123, align 8, !dbg !378
  %incdec.ptr124 = getelementptr inbounds i8, i8* %64, i32 1, !dbg !378
  store i8* %incdec.ptr124, i8** %ptr123, align 8, !dbg !378
  %65 = load i8, i8* %incdec.ptr124, align 1, !dbg !379
  %call125 = call zeroext i8 @hex_value(i8 signext %65), !dbg !380
  store i8 %call125, i8* %uc_b2, align 1, !dbg !381
  %conv126 = zext i8 %call125 to i32, !dbg !382
  %cmp127 = icmp eq i32 %conv126, 255, !dbg !383
  br i1 %cmp127, label %if.then143, label %lor.lhs.false129, !dbg !384

lor.lhs.false129:                                 ; preds = %lor.lhs.false122
  %ptr130 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !385
  %66 = load i8*, i8** %ptr130, align 8, !dbg !386
  %incdec.ptr131 = getelementptr inbounds i8, i8* %66, i32 1, !dbg !386
  store i8* %incdec.ptr131, i8** %ptr130, align 8, !dbg !386
  %67 = load i8, i8* %incdec.ptr131, align 1, !dbg !387
  %call132 = call zeroext i8 @hex_value(i8 signext %67), !dbg !388
  store i8 %call132, i8* %uc_b3, align 1, !dbg !389
  %conv133 = zext i8 %call132 to i32, !dbg !390
  %cmp134 = icmp eq i32 %conv133, 255, !dbg !391
  br i1 %cmp134, label %if.then143, label %lor.lhs.false136, !dbg !392

lor.lhs.false136:                                 ; preds = %lor.lhs.false129
  %ptr137 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !393
  %68 = load i8*, i8** %ptr137, align 8, !dbg !394
  %incdec.ptr138 = getelementptr inbounds i8, i8* %68, i32 1, !dbg !394
  store i8* %incdec.ptr138, i8** %ptr137, align 8, !dbg !394
  %69 = load i8, i8* %incdec.ptr138, align 1, !dbg !395
  %call139 = call zeroext i8 @hex_value(i8 signext %69), !dbg !396
  store i8 %call139, i8* %uc_b4, align 1, !dbg !397
  %conv140 = zext i8 %call139 to i32, !dbg !398
  %cmp141 = icmp eq i32 %conv140, 255, !dbg !399
  br i1 %cmp141, label %if.then143, label %if.end149, !dbg !400

if.then143:                                       ; preds = %lor.lhs.false136, %lor.lhs.false129, %lor.lhs.false122, %lor.lhs.false, %sw.bb113
  %arraydecay144 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !401
  %70 = load i8, i8* %b, align 1, !dbg !403
  %conv145 = sext i8 %70 to i32, !dbg !403
  %cur_line146 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !404
  %71 = load i32, i32* %cur_line146, align 8, !dbg !404
  %cur_col147 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !404
  %72 = load i32, i32* %cur_col147, align 4, !dbg !404
  %call148 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay144, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.2, i32 0, i32 0), i32 %conv145, i32 %71, i32 %72) #8, !dbg !405
  br label %e_failed, !dbg !406

if.end149:                                        ; preds = %lor.lhs.false136
  %73 = load i8, i8* %uc_b1, align 1, !dbg !407
  %conv150 = zext i8 %73 to i32, !dbg !407
  %shl = shl i32 %conv150, 4, !dbg !408
  %74 = load i8, i8* %uc_b2, align 1, !dbg !409
  %conv151 = zext i8 %74 to i32, !dbg !409
  %or = or i32 %shl, %conv151, !dbg !410
  %conv152 = trunc i32 %or to i8, !dbg !411
  store i8 %conv152, i8* %uc_b1, align 1, !dbg !412
  %75 = load i8, i8* %uc_b3, align 1, !dbg !413
  %conv153 = zext i8 %75 to i32, !dbg !413
  %shl154 = shl i32 %conv153, 4, !dbg !414
  %76 = load i8, i8* %uc_b4, align 1, !dbg !415
  %conv155 = zext i8 %76 to i32, !dbg !415
  %or156 = or i32 %shl154, %conv155, !dbg !416
  %conv157 = trunc i32 %or156 to i8, !dbg !417
  store i8 %conv157, i8* %uc_b2, align 1, !dbg !418
  %77 = load i8, i8* %uc_b1, align 1, !dbg !419
  %conv158 = zext i8 %77 to i32, !dbg !419
  %shl159 = shl i32 %conv158, 8, !dbg !420
  %78 = load i8, i8* %uc_b2, align 1, !dbg !421
  %conv160 = zext i8 %78 to i32, !dbg !421
  %or161 = or i32 %shl159, %conv160, !dbg !422
  store i32 %or161, i32* %uchar, align 4, !dbg !423
  %79 = load i32, i32* %uchar, align 4, !dbg !424
  %and162 = and i32 %79, 63488, !dbg !426
  %cmp163 = icmp eq i32 %and162, 55296, !dbg !427
  br i1 %cmp163, label %if.then165, label %if.end238, !dbg !428

if.then165:                                       ; preds = %if.end149
  call void @llvm.dbg.declare(metadata i32* %uchar2, metadata !429, metadata !DIExpression()), !dbg !431
  %80 = load i8*, i8** %end, align 8, !dbg !432
  %ptr166 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !434
  %81 = load i8*, i8** %ptr166, align 8, !dbg !434
  %sub.ptr.lhs.cast167 = ptrtoint i8* %80 to i64, !dbg !435
  %sub.ptr.rhs.cast168 = ptrtoint i8* %81 to i64, !dbg !435
  %sub.ptr.sub169 = sub i64 %sub.ptr.lhs.cast167, %sub.ptr.rhs.cast168, !dbg !435
  %cmp170 = icmp sle i64 %sub.ptr.sub169, 6, !dbg !436
  br i1 %cmp170, label %if.then212, label %lor.lhs.false172, !dbg !437

lor.lhs.false172:                                 ; preds = %if.then165
  %ptr173 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !438
  %82 = load i8*, i8** %ptr173, align 8, !dbg !439
  %incdec.ptr174 = getelementptr inbounds i8, i8* %82, i32 1, !dbg !439
  store i8* %incdec.ptr174, i8** %ptr173, align 8, !dbg !439
  %83 = load i8, i8* %incdec.ptr174, align 1, !dbg !440
  %conv175 = sext i8 %83 to i32, !dbg !441
  %cmp176 = icmp ne i32 %conv175, 92, !dbg !442
  br i1 %cmp176, label %if.then212, label %lor.lhs.false178, !dbg !443

lor.lhs.false178:                                 ; preds = %lor.lhs.false172
  %ptr179 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !444
  %84 = load i8*, i8** %ptr179, align 8, !dbg !445
  %incdec.ptr180 = getelementptr inbounds i8, i8* %84, i32 1, !dbg !445
  store i8* %incdec.ptr180, i8** %ptr179, align 8, !dbg !445
  %85 = load i8, i8* %incdec.ptr180, align 1, !dbg !446
  %conv181 = sext i8 %85 to i32, !dbg !447
  %cmp182 = icmp ne i32 %conv181, 117, !dbg !448
  br i1 %cmp182, label %if.then212, label %lor.lhs.false184, !dbg !449

lor.lhs.false184:                                 ; preds = %lor.lhs.false178
  %ptr185 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !450
  %86 = load i8*, i8** %ptr185, align 8, !dbg !451
  %incdec.ptr186 = getelementptr inbounds i8, i8* %86, i32 1, !dbg !451
  store i8* %incdec.ptr186, i8** %ptr185, align 8, !dbg !451
  %87 = load i8, i8* %incdec.ptr186, align 1, !dbg !452
  %call187 = call zeroext i8 @hex_value(i8 signext %87), !dbg !453
  store i8 %call187, i8* %uc_b1, align 1, !dbg !454
  %conv188 = zext i8 %call187 to i32, !dbg !455
  %cmp189 = icmp eq i32 %conv188, 255, !dbg !456
  br i1 %cmp189, label %if.then212, label %lor.lhs.false191, !dbg !457

lor.lhs.false191:                                 ; preds = %lor.lhs.false184
  %ptr192 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !458
  %88 = load i8*, i8** %ptr192, align 8, !dbg !459
  %incdec.ptr193 = getelementptr inbounds i8, i8* %88, i32 1, !dbg !459
  store i8* %incdec.ptr193, i8** %ptr192, align 8, !dbg !459
  %89 = load i8, i8* %incdec.ptr193, align 1, !dbg !460
  %call194 = call zeroext i8 @hex_value(i8 signext %89), !dbg !461
  store i8 %call194, i8* %uc_b2, align 1, !dbg !462
  %conv195 = zext i8 %call194 to i32, !dbg !463
  %cmp196 = icmp eq i32 %conv195, 255, !dbg !464
  br i1 %cmp196, label %if.then212, label %lor.lhs.false198, !dbg !465

lor.lhs.false198:                                 ; preds = %lor.lhs.false191
  %ptr199 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !466
  %90 = load i8*, i8** %ptr199, align 8, !dbg !467
  %incdec.ptr200 = getelementptr inbounds i8, i8* %90, i32 1, !dbg !467
  store i8* %incdec.ptr200, i8** %ptr199, align 8, !dbg !467
  %91 = load i8, i8* %incdec.ptr200, align 1, !dbg !468
  %call201 = call zeroext i8 @hex_value(i8 signext %91), !dbg !469
  store i8 %call201, i8* %uc_b3, align 1, !dbg !470
  %conv202 = zext i8 %call201 to i32, !dbg !471
  %cmp203 = icmp eq i32 %conv202, 255, !dbg !472
  br i1 %cmp203, label %if.then212, label %lor.lhs.false205, !dbg !473

lor.lhs.false205:                                 ; preds = %lor.lhs.false198
  %ptr206 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !474
  %92 = load i8*, i8** %ptr206, align 8, !dbg !475
  %incdec.ptr207 = getelementptr inbounds i8, i8* %92, i32 1, !dbg !475
  store i8* %incdec.ptr207, i8** %ptr206, align 8, !dbg !475
  %93 = load i8, i8* %incdec.ptr207, align 1, !dbg !476
  %call208 = call zeroext i8 @hex_value(i8 signext %93), !dbg !477
  store i8 %call208, i8* %uc_b4, align 1, !dbg !478
  %conv209 = zext i8 %call208 to i32, !dbg !479
  %cmp210 = icmp eq i32 %conv209, 255, !dbg !480
  br i1 %cmp210, label %if.then212, label %if.end218, !dbg !481

if.then212:                                       ; preds = %lor.lhs.false205, %lor.lhs.false198, %lor.lhs.false191, %lor.lhs.false184, %lor.lhs.false178, %lor.lhs.false172, %if.then165
  %arraydecay213 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !482
  %94 = load i8, i8* %b, align 1, !dbg !484
  %conv214 = sext i8 %94 to i32, !dbg !484
  %cur_line215 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !485
  %95 = load i32, i32* %cur_line215, align 8, !dbg !485
  %cur_col216 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !485
  %96 = load i32, i32* %cur_col216, align 4, !dbg !485
  %call217 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay213, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.2, i32 0, i32 0), i32 %conv214, i32 %95, i32 %96) #8, !dbg !486
  br label %e_failed, !dbg !487

if.end218:                                        ; preds = %lor.lhs.false205
  %97 = load i8, i8* %uc_b1, align 1, !dbg !488
  %conv219 = zext i8 %97 to i32, !dbg !488
  %shl220 = shl i32 %conv219, 4, !dbg !489
  %98 = load i8, i8* %uc_b2, align 1, !dbg !490
  %conv221 = zext i8 %98 to i32, !dbg !490
  %or222 = or i32 %shl220, %conv221, !dbg !491
  %conv223 = trunc i32 %or222 to i8, !dbg !492
  store i8 %conv223, i8* %uc_b1, align 1, !dbg !493
  %99 = load i8, i8* %uc_b3, align 1, !dbg !494
  %conv224 = zext i8 %99 to i32, !dbg !494
  %shl225 = shl i32 %conv224, 4, !dbg !495
  %100 = load i8, i8* %uc_b4, align 1, !dbg !496
  %conv226 = zext i8 %100 to i32, !dbg !496
  %or227 = or i32 %shl225, %conv226, !dbg !497
  %conv228 = trunc i32 %or227 to i8, !dbg !498
  store i8 %conv228, i8* %uc_b2, align 1, !dbg !499
  %101 = load i8, i8* %uc_b1, align 1, !dbg !500
  %conv229 = zext i8 %101 to i32, !dbg !500
  %shl230 = shl i32 %conv229, 8, !dbg !501
  %102 = load i8, i8* %uc_b2, align 1, !dbg !502
  %conv231 = zext i8 %102 to i32, !dbg !502
  %or232 = or i32 %shl230, %conv231, !dbg !503
  store i32 %or232, i32* %uchar2, align 4, !dbg !504
  %103 = load i32, i32* %uchar, align 4, !dbg !505
  %and233 = and i32 %103, 1023, !dbg !506
  %shl234 = shl i32 %and233, 10, !dbg !507
  %or235 = or i32 65536, %shl234, !dbg !508
  %104 = load i32, i32* %uchar2, align 4, !dbg !509
  %and236 = and i32 %104, 1023, !dbg !510
  %or237 = or i32 %or235, %and236, !dbg !511
  store i32 %or237, i32* %uchar, align 4, !dbg !512
  br label %if.end238, !dbg !513

if.end238:                                        ; preds = %if.end218, %if.end149
  %105 = load i32, i32* %uchar, align 4, !dbg !514
  %cmp239 = icmp ule i32 %105, 127, !dbg !516
  br i1 %cmp239, label %if.then241, label %if.end252, !dbg !517

if.then241:                                       ; preds = %if.end238
  br label %do.body242, !dbg !518

do.body242:                                       ; preds = %if.then241
  %first_pass243 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !520
  %106 = load i32, i32* %first_pass243, align 8, !dbg !520
  %tobool244 = icmp ne i32 %106, 0, !dbg !520
  br i1 %tobool244, label %if.end249, label %if.then245, !dbg !523

if.then245:                                       ; preds = %do.body242
  %107 = load i32, i32* %uchar, align 4, !dbg !520
  %conv246 = trunc i32 %107 to i8, !dbg !520
  %108 = load i8*, i8** %string, align 8, !dbg !520
  %109 = load i32, i32* %string_length, align 4, !dbg !520
  %idxprom247 = zext i32 %109 to i64, !dbg !520
  %arrayidx248 = getelementptr inbounds i8, i8* %108, i64 %idxprom247, !dbg !520
  store i8 %conv246, i8* %arrayidx248, align 1, !dbg !520
  br label %if.end249, !dbg !520

if.end249:                                        ; preds = %if.then245, %do.body242
  %110 = load i32, i32* %string_length, align 4, !dbg !523
  %inc250 = add i32 %110, 1, !dbg !523
  store i32 %inc250, i32* %string_length, align 4, !dbg !523
  br label %do.end251, !dbg !523

do.end251:                                        ; preds = %if.end249
  br label %sw.epilog, !dbg !524

if.end252:                                        ; preds = %if.end238
  %111 = load i32, i32* %uchar, align 4, !dbg !525
  %cmp253 = icmp ule i32 %111, 2047, !dbg !527
  br i1 %cmp253, label %if.then255, label %if.end271, !dbg !528

if.then255:                                       ; preds = %if.end252
  %first_pass256 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !529
  %112 = load i32, i32* %first_pass256, align 8, !dbg !529
  %tobool257 = icmp ne i32 %112, 0, !dbg !532
  br i1 %tobool257, label %if.then258, label %if.else, !dbg !533

if.then258:                                       ; preds = %if.then255
  %113 = load i32, i32* %string_length, align 4, !dbg !534
  %add = add i32 %113, 2, !dbg !534
  store i32 %add, i32* %string_length, align 4, !dbg !534
  br label %if.end270, !dbg !535

if.else:                                          ; preds = %if.then255
  %114 = load i32, i32* %uchar, align 4, !dbg !536
  %shr = lshr i32 %114, 6, !dbg !538
  %or259 = or i32 192, %shr, !dbg !539
  %conv260 = trunc i32 %or259 to i8, !dbg !540
  %115 = load i8*, i8** %string, align 8, !dbg !541
  %116 = load i32, i32* %string_length, align 4, !dbg !542
  %inc261 = add i32 %116, 1, !dbg !542
  store i32 %inc261, i32* %string_length, align 4, !dbg !542
  %idxprom262 = zext i32 %116 to i64, !dbg !541
  %arrayidx263 = getelementptr inbounds i8, i8* %115, i64 %idxprom262, !dbg !541
  store i8 %conv260, i8* %arrayidx263, align 1, !dbg !543
  %117 = load i32, i32* %uchar, align 4, !dbg !544
  %and264 = and i32 %117, 63, !dbg !545
  %or265 = or i32 128, %and264, !dbg !546
  %conv266 = trunc i32 %or265 to i8, !dbg !547
  %118 = load i8*, i8** %string, align 8, !dbg !548
  %119 = load i32, i32* %string_length, align 4, !dbg !549
  %inc267 = add i32 %119, 1, !dbg !549
  store i32 %inc267, i32* %string_length, align 4, !dbg !549
  %idxprom268 = zext i32 %119 to i64, !dbg !548
  %arrayidx269 = getelementptr inbounds i8, i8* %118, i64 %idxprom268, !dbg !548
  store i8 %conv266, i8* %arrayidx269, align 1, !dbg !550
  br label %if.end270

if.end270:                                        ; preds = %if.else, %if.then258
  br label %sw.epilog, !dbg !551

if.end271:                                        ; preds = %if.end252
  %120 = load i32, i32* %uchar, align 4, !dbg !552
  %cmp272 = icmp ule i32 %120, 65535, !dbg !554
  br i1 %cmp272, label %if.then274, label %if.end300, !dbg !555

if.then274:                                       ; preds = %if.end271
  %first_pass275 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !556
  %121 = load i32, i32* %first_pass275, align 8, !dbg !556
  %tobool276 = icmp ne i32 %121, 0, !dbg !559
  br i1 %tobool276, label %if.then277, label %if.else279, !dbg !560

if.then277:                                       ; preds = %if.then274
  %122 = load i32, i32* %string_length, align 4, !dbg !561
  %add278 = add i32 %122, 3, !dbg !561
  store i32 %add278, i32* %string_length, align 4, !dbg !561
  br label %if.end299, !dbg !562

if.else279:                                       ; preds = %if.then274
  %123 = load i32, i32* %uchar, align 4, !dbg !563
  %shr280 = lshr i32 %123, 12, !dbg !565
  %or281 = or i32 224, %shr280, !dbg !566
  %conv282 = trunc i32 %or281 to i8, !dbg !567
  %124 = load i8*, i8** %string, align 8, !dbg !568
  %125 = load i32, i32* %string_length, align 4, !dbg !569
  %inc283 = add i32 %125, 1, !dbg !569
  store i32 %inc283, i32* %string_length, align 4, !dbg !569
  %idxprom284 = zext i32 %125 to i64, !dbg !568
  %arrayidx285 = getelementptr inbounds i8, i8* %124, i64 %idxprom284, !dbg !568
  store i8 %conv282, i8* %arrayidx285, align 1, !dbg !570
  %126 = load i32, i32* %uchar, align 4, !dbg !571
  %shr286 = lshr i32 %126, 6, !dbg !572
  %and287 = and i32 %shr286, 63, !dbg !573
  %or288 = or i32 128, %and287, !dbg !574
  %conv289 = trunc i32 %or288 to i8, !dbg !575
  %127 = load i8*, i8** %string, align 8, !dbg !576
  %128 = load i32, i32* %string_length, align 4, !dbg !577
  %inc290 = add i32 %128, 1, !dbg !577
  store i32 %inc290, i32* %string_length, align 4, !dbg !577
  %idxprom291 = zext i32 %128 to i64, !dbg !576
  %arrayidx292 = getelementptr inbounds i8, i8* %127, i64 %idxprom291, !dbg !576
  store i8 %conv289, i8* %arrayidx292, align 1, !dbg !578
  %129 = load i32, i32* %uchar, align 4, !dbg !579
  %and293 = and i32 %129, 63, !dbg !580
  %or294 = or i32 128, %and293, !dbg !581
  %conv295 = trunc i32 %or294 to i8, !dbg !582
  %130 = load i8*, i8** %string, align 8, !dbg !583
  %131 = load i32, i32* %string_length, align 4, !dbg !584
  %inc296 = add i32 %131, 1, !dbg !584
  store i32 %inc296, i32* %string_length, align 4, !dbg !584
  %idxprom297 = zext i32 %131 to i64, !dbg !583
  %arrayidx298 = getelementptr inbounds i8, i8* %130, i64 %idxprom297, !dbg !583
  store i8 %conv295, i8* %arrayidx298, align 1, !dbg !585
  br label %if.end299

if.end299:                                        ; preds = %if.else279, %if.then277
  br label %sw.epilog, !dbg !586

if.end300:                                        ; preds = %if.end271
  %first_pass301 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !587
  %132 = load i32, i32* %first_pass301, align 8, !dbg !587
  %tobool302 = icmp ne i32 %132, 0, !dbg !589
  br i1 %tobool302, label %if.then303, label %if.else305, !dbg !590

if.then303:                                       ; preds = %if.end300
  %133 = load i32, i32* %string_length, align 4, !dbg !591
  %add304 = add i32 %133, 4, !dbg !591
  store i32 %add304, i32* %string_length, align 4, !dbg !591
  br label %if.end332, !dbg !592

if.else305:                                       ; preds = %if.end300
  %134 = load i32, i32* %uchar, align 4, !dbg !593
  %shr306 = lshr i32 %134, 18, !dbg !595
  %or307 = or i32 240, %shr306, !dbg !596
  %conv308 = trunc i32 %or307 to i8, !dbg !597
  %135 = load i8*, i8** %string, align 8, !dbg !598
  %136 = load i32, i32* %string_length, align 4, !dbg !599
  %inc309 = add i32 %136, 1, !dbg !599
  store i32 %inc309, i32* %string_length, align 4, !dbg !599
  %idxprom310 = zext i32 %136 to i64, !dbg !598
  %arrayidx311 = getelementptr inbounds i8, i8* %135, i64 %idxprom310, !dbg !598
  store i8 %conv308, i8* %arrayidx311, align 1, !dbg !600
  %137 = load i32, i32* %uchar, align 4, !dbg !601
  %shr312 = lshr i32 %137, 12, !dbg !602
  %and313 = and i32 %shr312, 63, !dbg !603
  %or314 = or i32 128, %and313, !dbg !604
  %conv315 = trunc i32 %or314 to i8, !dbg !605
  %138 = load i8*, i8** %string, align 8, !dbg !606
  %139 = load i32, i32* %string_length, align 4, !dbg !607
  %inc316 = add i32 %139, 1, !dbg !607
  store i32 %inc316, i32* %string_length, align 4, !dbg !607
  %idxprom317 = zext i32 %139 to i64, !dbg !606
  %arrayidx318 = getelementptr inbounds i8, i8* %138, i64 %idxprom317, !dbg !606
  store i8 %conv315, i8* %arrayidx318, align 1, !dbg !608
  %140 = load i32, i32* %uchar, align 4, !dbg !609
  %shr319 = lshr i32 %140, 6, !dbg !610
  %and320 = and i32 %shr319, 63, !dbg !611
  %or321 = or i32 128, %and320, !dbg !612
  %conv322 = trunc i32 %or321 to i8, !dbg !613
  %141 = load i8*, i8** %string, align 8, !dbg !614
  %142 = load i32, i32* %string_length, align 4, !dbg !615
  %inc323 = add i32 %142, 1, !dbg !615
  store i32 %inc323, i32* %string_length, align 4, !dbg !615
  %idxprom324 = zext i32 %142 to i64, !dbg !614
  %arrayidx325 = getelementptr inbounds i8, i8* %141, i64 %idxprom324, !dbg !614
  store i8 %conv322, i8* %arrayidx325, align 1, !dbg !616
  %143 = load i32, i32* %uchar, align 4, !dbg !617
  %and326 = and i32 %143, 63, !dbg !618
  %or327 = or i32 128, %and326, !dbg !619
  %conv328 = trunc i32 %or327 to i8, !dbg !620
  %144 = load i8*, i8** %string, align 8, !dbg !621
  %145 = load i32, i32* %string_length, align 4, !dbg !622
  %inc329 = add i32 %145, 1, !dbg !622
  store i32 %inc329, i32* %string_length, align 4, !dbg !622
  %idxprom330 = zext i32 %145 to i64, !dbg !621
  %arrayidx331 = getelementptr inbounds i8, i8* %144, i64 %idxprom330, !dbg !621
  store i8 %conv328, i8* %arrayidx331, align 1, !dbg !623
  br label %if.end332

if.end332:                                        ; preds = %if.else305, %if.then303
  br label %sw.epilog, !dbg !624

sw.default:                                       ; preds = %if.then63
  br label %do.body333, !dbg !625

do.body333:                                       ; preds = %sw.default
  %first_pass334 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !626
  %146 = load i32, i32* %first_pass334, align 8, !dbg !626
  %tobool335 = icmp ne i32 %146, 0, !dbg !626
  br i1 %tobool335, label %if.end339, label %if.then336, !dbg !629

if.then336:                                       ; preds = %do.body333
  %147 = load i8, i8* %b, align 1, !dbg !626
  %148 = load i8*, i8** %string, align 8, !dbg !626
  %149 = load i32, i32* %string_length, align 4, !dbg !626
  %idxprom337 = zext i32 %149 to i64, !dbg !626
  %arrayidx338 = getelementptr inbounds i8, i8* %148, i64 %idxprom337, !dbg !626
  store i8 %147, i8* %arrayidx338, align 1, !dbg !626
  br label %if.end339, !dbg !626

if.end339:                                        ; preds = %if.then336, %do.body333
  %150 = load i32, i32* %string_length, align 4, !dbg !629
  %inc340 = add i32 %150, 1, !dbg !629
  store i32 %inc340, i32* %string_length, align 4, !dbg !629
  br label %do.end341, !dbg !629

do.end341:                                        ; preds = %if.end339
  br label %sw.epilog, !dbg !630

sw.epilog:                                        ; preds = %do.end341, %if.end332, %if.end299, %if.end270, %do.end251, %do.end112, %do.end102, %do.end92, %do.end82, %do.end
  br label %for.inc, !dbg !631

if.end342:                                        ; preds = %if.end59
  %151 = load i8, i8* %b, align 1, !dbg !632
  %conv343 = sext i8 %151 to i32, !dbg !632
  %cmp344 = icmp eq i32 %conv343, 92, !dbg !634
  br i1 %cmp344, label %if.then346, label %if.end350, !dbg !635

if.then346:                                       ; preds = %if.end342
  %152 = load i32, i32* %flags, align 4, !dbg !636
  %conv347 = sext i32 %152 to i64, !dbg !636
  %or348 = or i64 %conv347, 16, !dbg !636
  %conv349 = trunc i64 %or348 to i32, !dbg !636
  store i32 %conv349, i32* %flags, align 4, !dbg !636
  br label %for.inc, !dbg !638

if.end350:                                        ; preds = %if.end342
  %153 = load i8, i8* %b, align 1, !dbg !639
  %conv351 = sext i8 %153 to i32, !dbg !639
  %cmp352 = icmp eq i32 %conv351, 34, !dbg !641
  br i1 %cmp352, label %if.then354, label %if.else405, !dbg !642

if.then354:                                       ; preds = %if.end350
  %first_pass355 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !643
  %154 = load i32, i32* %first_pass355, align 8, !dbg !643
  %tobool356 = icmp ne i32 %154, 0, !dbg !646
  br i1 %tobool356, label %if.end360, label %if.then357, !dbg !647

if.then357:                                       ; preds = %if.then354
  %155 = load i8*, i8** %string, align 8, !dbg !648
  %156 = load i32, i32* %string_length, align 4, !dbg !649
  %idxprom358 = zext i32 %156 to i64, !dbg !648
  %arrayidx359 = getelementptr inbounds i8, i8* %155, i64 %idxprom358, !dbg !648
  store i8 0, i8* %arrayidx359, align 1, !dbg !650
  br label %if.end360, !dbg !648

if.end360:                                        ; preds = %if.then357, %if.then354
  %157 = load i32, i32* %flags, align 4, !dbg !651
  %conv361 = sext i32 %157 to i64, !dbg !651
  %and362 = and i64 %conv361, -33, !dbg !651
  %conv363 = trunc i64 %and362 to i32, !dbg !651
  store i32 %conv363, i32* %flags, align 4, !dbg !651
  store i8* null, i8** %string, align 8, !dbg !652
  %158 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !653
  %type = getelementptr inbounds %struct._json_value, %struct._json_value* %158, i32 0, i32 1, !dbg !654
  %159 = load i32, i32* %type, align 8, !dbg !654
  switch i32 %159, label %sw.default403 [
    i32 5, label %sw.bb364
    i32 1, label %sw.bb370
  ], !dbg !655

sw.bb364:                                         ; preds = %if.end360
  %160 = load i32, i32* %string_length, align 4, !dbg !656
  %161 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !658
  %u = getelementptr inbounds %struct._json_value, %struct._json_value* %161, i32 0, i32 2, !dbg !659
  %string365 = bitcast %union.anon* %u to %struct.anon*, !dbg !660
  %length366 = getelementptr inbounds %struct.anon, %struct.anon* %string365, i32 0, i32 0, !dbg !661
  store i32 %160, i32* %length366, align 8, !dbg !662
  %162 = load i32, i32* %flags, align 4, !dbg !663
  %conv367 = sext i32 %162 to i64, !dbg !663
  %or368 = or i64 %conv367, 1, !dbg !663
  %conv369 = trunc i64 %or368 to i32, !dbg !663
  store i32 %conv369, i32* %flags, align 4, !dbg !663
  br label %sw.epilog404, !dbg !664

sw.bb370:                                         ; preds = %if.end360
  %first_pass371 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !665
  %163 = load i32, i32* %first_pass371, align 8, !dbg !665
  %tobool372 = icmp ne i32 %163, 0, !dbg !667
  br i1 %tobool372, label %if.then373, label %if.else377, !dbg !668

if.then373:                                       ; preds = %sw.bb370
  %164 = load i32, i32* %string_length, align 4, !dbg !669
  %add374 = add i32 %164, 1, !dbg !670
  %165 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !671
  %u375 = getelementptr inbounds %struct._json_value, %struct._json_value* %165, i32 0, i32 2, !dbg !672
  %object = bitcast %union.anon* %u375 to %struct.anon.0*, !dbg !673
  %values = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object, i32 0, i32 1, !dbg !674
  %166 = bitcast %struct._json_object_entry** %values to i8**, !dbg !675
  %167 = load i8*, i8** %166, align 8, !dbg !676
  %idx.ext = zext i32 %add374 to i64, !dbg !676
  %add.ptr376 = getelementptr inbounds i8, i8* %167, i64 %idx.ext, !dbg !676
  store i8* %add.ptr376, i8** %166, align 8, !dbg !676
  br label %if.end399, !dbg !677

if.else377:                                       ; preds = %sw.bb370
  %168 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !678
  %_reserved = getelementptr inbounds %struct._json_value, %struct._json_value* %168, i32 0, i32 3, !dbg !680
  %object_mem = bitcast %union.anon.2* %_reserved to i8**, !dbg !681
  %169 = load i8*, i8** %object_mem, align 8, !dbg !681
  %170 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !682
  %u378 = getelementptr inbounds %struct._json_value, %struct._json_value* %170, i32 0, i32 2, !dbg !683
  %object379 = bitcast %union.anon* %u378 to %struct.anon.0*, !dbg !684
  %values380 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object379, i32 0, i32 1, !dbg !685
  %171 = load %struct._json_object_entry*, %struct._json_object_entry** %values380, align 8, !dbg !685
  %172 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !686
  %u381 = getelementptr inbounds %struct._json_value, %struct._json_value* %172, i32 0, i32 2, !dbg !687
  %object382 = bitcast %union.anon* %u381 to %struct.anon.0*, !dbg !688
  %length383 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object382, i32 0, i32 0, !dbg !689
  %173 = load i32, i32* %length383, align 8, !dbg !689
  %idxprom384 = zext i32 %173 to i64, !dbg !682
  %arrayidx385 = getelementptr inbounds %struct._json_object_entry, %struct._json_object_entry* %171, i64 %idxprom384, !dbg !682
  %name = getelementptr inbounds %struct._json_object_entry, %struct._json_object_entry* %arrayidx385, i32 0, i32 0, !dbg !690
  store i8* %169, i8** %name, align 8, !dbg !691
  %174 = load i32, i32* %string_length, align 4, !dbg !692
  %175 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !693
  %u386 = getelementptr inbounds %struct._json_value, %struct._json_value* %175, i32 0, i32 2, !dbg !694
  %object387 = bitcast %union.anon* %u386 to %struct.anon.0*, !dbg !695
  %values388 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object387, i32 0, i32 1, !dbg !696
  %176 = load %struct._json_object_entry*, %struct._json_object_entry** %values388, align 8, !dbg !696
  %177 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !697
  %u389 = getelementptr inbounds %struct._json_value, %struct._json_value* %177, i32 0, i32 2, !dbg !698
  %object390 = bitcast %union.anon* %u389 to %struct.anon.0*, !dbg !699
  %length391 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object390, i32 0, i32 0, !dbg !700
  %178 = load i32, i32* %length391, align 8, !dbg !700
  %idxprom392 = zext i32 %178 to i64, !dbg !693
  %arrayidx393 = getelementptr inbounds %struct._json_object_entry, %struct._json_object_entry* %176, i64 %idxprom392, !dbg !693
  %name_length = getelementptr inbounds %struct._json_object_entry, %struct._json_object_entry* %arrayidx393, i32 0, i32 1, !dbg !701
  store i32 %174, i32* %name_length, align 8, !dbg !702
  %179 = load i32, i32* %string_length, align 4, !dbg !703
  %add394 = add i32 %179, 1, !dbg !704
  %180 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !705
  %_reserved395 = getelementptr inbounds %struct._json_value, %struct._json_value* %180, i32 0, i32 3, !dbg !706
  %object_mem396 = bitcast %union.anon.2* %_reserved395 to i8**, !dbg !707
  %181 = load i8*, i8** %object_mem396, align 8, !dbg !708
  %idx.ext397 = zext i32 %add394 to i64, !dbg !708
  %add.ptr398 = getelementptr inbounds i8, i8* %181, i64 %idx.ext397, !dbg !708
  store i8* %add.ptr398, i8** %object_mem396, align 8, !dbg !708
  br label %if.end399

if.end399:                                        ; preds = %if.else377, %if.then373
  %182 = load i32, i32* %flags, align 4, !dbg !709
  %conv400 = sext i32 %182 to i64, !dbg !709
  %or401 = or i64 %conv400, 72, !dbg !709
  %conv402 = trunc i64 %or401 to i32, !dbg !709
  store i32 %conv402, i32* %flags, align 4, !dbg !709
  br label %for.inc, !dbg !710

sw.default403:                                    ; preds = %if.end360
  br label %sw.epilog404, !dbg !711

sw.epilog404:                                     ; preds = %sw.default403, %sw.bb364
  br label %if.end415, !dbg !712

if.else405:                                       ; preds = %if.end350
  br label %do.body406, !dbg !713

do.body406:                                       ; preds = %if.else405
  %first_pass407 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !715
  %183 = load i32, i32* %first_pass407, align 8, !dbg !715
  %tobool408 = icmp ne i32 %183, 0, !dbg !715
  br i1 %tobool408, label %if.end412, label %if.then409, !dbg !718

if.then409:                                       ; preds = %do.body406
  %184 = load i8, i8* %b, align 1, !dbg !715
  %185 = load i8*, i8** %string, align 8, !dbg !715
  %186 = load i32, i32* %string_length, align 4, !dbg !715
  %idxprom410 = zext i32 %186 to i64, !dbg !715
  %arrayidx411 = getelementptr inbounds i8, i8* %185, i64 %idxprom410, !dbg !715
  store i8 %184, i8* %arrayidx411, align 1, !dbg !715
  br label %if.end412, !dbg !715

if.end412:                                        ; preds = %if.then409, %do.body406
  %187 = load i32, i32* %string_length, align 4, !dbg !718
  %inc413 = add i32 %187, 1, !dbg !718
  store i32 %inc413, i32* %string_length, align 4, !dbg !718
  br label %do.end414, !dbg !718

do.end414:                                        ; preds = %if.end412
  br label %for.inc, !dbg !719

if.end415:                                        ; preds = %sw.epilog404
  br label %if.end416, !dbg !720

if.end416:                                        ; preds = %if.end415, %if.end46
  %settings417 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !721
  %settings418 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings417, i32 0, i32 1, !dbg !723
  %188 = load i32, i32* %settings418, align 8, !dbg !723
  %and419 = and i32 %188, 1, !dbg !724
  %tobool420 = icmp ne i32 %and419, 0, !dbg !724
  br i1 %tobool420, label %if.then421, label %if.end526, !dbg !725

if.then421:                                       ; preds = %if.end416
  %189 = load i32, i32* %flags, align 4, !dbg !726
  %conv422 = sext i32 %189 to i64, !dbg !726
  %and423 = and i64 %conv422, 24576, !dbg !729
  %tobool424 = icmp ne i64 %and423, 0, !dbg !729
  br i1 %tobool424, label %if.then425, label %if.else480, !dbg !730

if.then425:                                       ; preds = %if.then421
  %190 = load i32, i32* %flags, align 4, !dbg !731
  %conv426 = sext i32 %190 to i64, !dbg !731
  %and427 = and i64 %conv426, 8192, !dbg !734
  %tobool428 = icmp ne i64 %and427, 0, !dbg !734
  br i1 %tobool428, label %if.then429, label %if.end446, !dbg !735

if.then429:                                       ; preds = %if.then425
  %191 = load i8, i8* %b, align 1, !dbg !736
  %conv430 = sext i8 %191 to i32, !dbg !736
  %cmp431 = icmp eq i32 %conv430, 13, !dbg !739
  br i1 %cmp431, label %if.then439, label %lor.lhs.false433, !dbg !740

lor.lhs.false433:                                 ; preds = %if.then429
  %192 = load i8, i8* %b, align 1, !dbg !741
  %conv434 = sext i8 %192 to i32, !dbg !741
  %cmp435 = icmp eq i32 %conv434, 10, !dbg !742
  br i1 %cmp435, label %if.then439, label %lor.lhs.false437, !dbg !743

lor.lhs.false437:                                 ; preds = %lor.lhs.false433
  %193 = load i8, i8* %b, align 1, !dbg !744
  %tobool438 = icmp ne i8 %193, 0, !dbg !744
  br i1 %tobool438, label %if.end445, label %if.then439, !dbg !745

if.then439:                                       ; preds = %lor.lhs.false437, %lor.lhs.false433, %if.then429
  %194 = load i32, i32* %flags, align 4, !dbg !746
  %conv440 = sext i32 %194 to i64, !dbg !746
  %and441 = and i64 %conv440, -8193, !dbg !746
  %conv442 = trunc i64 %and441 to i32, !dbg !746
  store i32 %conv442, i32* %flags, align 4, !dbg !746
  %ptr443 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !748
  %195 = load i8*, i8** %ptr443, align 8, !dbg !749
  %incdec.ptr444 = getelementptr inbounds i8, i8* %195, i32 -1, !dbg !749
  store i8* %incdec.ptr444, i8** %ptr443, align 8, !dbg !749
  br label %if.end445, !dbg !750

if.end445:                                        ; preds = %if.then439, %lor.lhs.false437
  br label %for.inc, !dbg !751

if.end446:                                        ; preds = %if.then425
  %196 = load i32, i32* %flags, align 4, !dbg !752
  %conv447 = sext i32 %196 to i64, !dbg !752
  %and448 = and i64 %conv447, 16384, !dbg !754
  %tobool449 = icmp ne i64 %and448, 0, !dbg !754
  br i1 %tobool449, label %if.then450, label %if.end479, !dbg !755

if.then450:                                       ; preds = %if.end446
  %197 = load i8, i8* %b, align 1, !dbg !756
  %tobool451 = icmp ne i8 %197, 0, !dbg !756
  br i1 %tobool451, label %if.end457, label %if.then452, !dbg !759

if.then452:                                       ; preds = %if.then450
  %arraydecay453 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !760
  %cur_line454 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !762
  %198 = load i32, i32* %cur_line454, align 8, !dbg !762
  %cur_col455 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !762
  %199 = load i32, i32* %cur_col455, align 4, !dbg !762
  %call456 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay453, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.3, i32 0, i32 0), i32 %198, i32 %199) #8, !dbg !763
  br label %e_failed, !dbg !764

if.end457:                                        ; preds = %if.then450
  %200 = load i8, i8* %b, align 1, !dbg !765
  %conv458 = sext i8 %200 to i32, !dbg !765
  %cmp459 = icmp eq i32 %conv458, 42, !dbg !767
  br i1 %cmp459, label %land.lhs.true461, label %if.end478, !dbg !768

land.lhs.true461:                                 ; preds = %if.end457
  %ptr462 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !769
  %201 = load i8*, i8** %ptr462, align 8, !dbg !769
  %202 = load i8*, i8** %end, align 8, !dbg !770
  %add.ptr463 = getelementptr inbounds i8, i8* %202, i64 -1, !dbg !771
  %cmp464 = icmp ult i8* %201, %add.ptr463, !dbg !772
  br i1 %cmp464, label %land.lhs.true466, label %if.end478, !dbg !773

land.lhs.true466:                                 ; preds = %land.lhs.true461
  %ptr467 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !774
  %203 = load i8*, i8** %ptr467, align 8, !dbg !774
  %arrayidx468 = getelementptr inbounds i8, i8* %203, i64 1, !dbg !775
  %204 = load i8, i8* %arrayidx468, align 1, !dbg !775
  %conv469 = sext i8 %204 to i32, !dbg !775
  %cmp470 = icmp eq i32 %conv469, 47, !dbg !776
  br i1 %cmp470, label %if.then472, label %if.end478, !dbg !777

if.then472:                                       ; preds = %land.lhs.true466
  %205 = load i32, i32* %flags, align 4, !dbg !778
  %conv473 = sext i32 %205 to i64, !dbg !778
  %and474 = and i64 %conv473, -16385, !dbg !778
  %conv475 = trunc i64 %and474 to i32, !dbg !778
  store i32 %conv475, i32* %flags, align 4, !dbg !778
  %ptr476 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !780
  %206 = load i8*, i8** %ptr476, align 8, !dbg !781
  %incdec.ptr477 = getelementptr inbounds i8, i8* %206, i32 1, !dbg !781
  store i8* %incdec.ptr477, i8** %ptr476, align 8, !dbg !781
  br label %if.end478, !dbg !782

if.end478:                                        ; preds = %if.then472, %land.lhs.true466, %land.lhs.true461, %if.end457
  br label %for.inc, !dbg !783

if.end479:                                        ; preds = %if.end446
  br label %if.end525, !dbg !784

if.else480:                                       ; preds = %if.then421
  %207 = load i8, i8* %b, align 1, !dbg !785
  %conv481 = sext i8 %207 to i32, !dbg !785
  %cmp482 = icmp eq i32 %conv481, 47, !dbg !787
  br i1 %cmp482, label %if.then484, label %if.end524, !dbg !788

if.then484:                                       ; preds = %if.else480
  %208 = load i32, i32* %flags, align 4, !dbg !789
  %conv485 = sext i32 %208 to i64, !dbg !789
  %and486 = and i64 %conv485, 136, !dbg !792
  %tobool487 = icmp ne i64 %and486, 0, !dbg !792
  br i1 %tobool487, label %if.end497, label %land.lhs.true488, !dbg !793

land.lhs.true488:                                 ; preds = %if.then484
  %209 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !794
  %type489 = getelementptr inbounds %struct._json_value, %struct._json_value* %209, i32 0, i32 1, !dbg !795
  %210 = load i32, i32* %type489, align 8, !dbg !795
  %cmp490 = icmp ne i32 %210, 1, !dbg !796
  br i1 %cmp490, label %if.then492, label %if.end497, !dbg !797

if.then492:                                       ; preds = %land.lhs.true488
  %arraydecay493 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !798
  %cur_line494 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !800
  %211 = load i32, i32* %cur_line494, align 8, !dbg !800
  %cur_col495 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !800
  %212 = load i32, i32* %cur_col495, align 4, !dbg !800
  %call496 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay493, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i32 0, i32 0), i32 %211, i32 %212) #8, !dbg !801
  br label %e_failed, !dbg !802

if.end497:                                        ; preds = %land.lhs.true488, %if.then484
  %ptr498 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !803
  %213 = load i8*, i8** %ptr498, align 8, !dbg !805
  %incdec.ptr499 = getelementptr inbounds i8, i8* %213, i32 1, !dbg !805
  store i8* %incdec.ptr499, i8** %ptr498, align 8, !dbg !805
  %214 = load i8*, i8** %end, align 8, !dbg !806
  %cmp500 = icmp eq i8* %incdec.ptr499, %214, !dbg !807
  br i1 %cmp500, label %if.then502, label %if.end507, !dbg !808

if.then502:                                       ; preds = %if.end497
  %arraydecay503 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !809
  %cur_line504 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !811
  %215 = load i32, i32* %cur_line504, align 8, !dbg !811
  %cur_col505 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !811
  %216 = load i32, i32* %cur_col505, align 4, !dbg !811
  %call506 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay503, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i32 0, i32 0), i32 %215, i32 %216) #8, !dbg !812
  br label %e_failed, !dbg !813

if.end507:                                        ; preds = %if.end497
  %ptr508 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !814
  %217 = load i8*, i8** %ptr508, align 8, !dbg !814
  %218 = load i8, i8* %217, align 1, !dbg !815
  store i8 %218, i8* %b, align 1, !dbg !816
  %conv509 = sext i8 %218 to i32, !dbg !817
  switch i32 %conv509, label %sw.default518 [
    i32 47, label %sw.bb510
    i32 42, label %sw.bb514
  ], !dbg !818

sw.bb510:                                         ; preds = %if.end507
  %219 = load i32, i32* %flags, align 4, !dbg !819
  %conv511 = sext i32 %219 to i64, !dbg !819
  %or512 = or i64 %conv511, 8192, !dbg !819
  %conv513 = trunc i64 %or512 to i32, !dbg !819
  store i32 %conv513, i32* %flags, align 4, !dbg !819
  br label %for.inc, !dbg !821

sw.bb514:                                         ; preds = %if.end507
  %220 = load i32, i32* %flags, align 4, !dbg !822
  %conv515 = sext i32 %220 to i64, !dbg !822
  %or516 = or i64 %conv515, 16384, !dbg !822
  %conv517 = trunc i64 %or516 to i32, !dbg !822
  store i32 %conv517, i32* %flags, align 4, !dbg !822
  br label %for.inc, !dbg !823

sw.default518:                                    ; preds = %if.end507
  %arraydecay519 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !824
  %cur_line520 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !825
  %221 = load i32, i32* %cur_line520, align 8, !dbg !825
  %cur_col521 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !825
  %222 = load i32, i32* %cur_col521, align 4, !dbg !825
  %223 = load i8, i8* %b, align 1, !dbg !826
  %conv522 = sext i8 %223 to i32, !dbg !826
  %call523 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay519, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.6, i32 0, i32 0), i32 %221, i32 %222, i32 %conv522) #8, !dbg !827
  br label %e_failed, !dbg !828

if.end524:                                        ; preds = %if.else480
  br label %if.end525

if.end525:                                        ; preds = %if.end524, %if.end479
  br label %if.end526, !dbg !829

if.end526:                                        ; preds = %if.end525, %if.end416
  %224 = load i32, i32* %flags, align 4, !dbg !830
  %conv527 = sext i32 %224 to i64, !dbg !830
  %and528 = and i64 %conv527, 128, !dbg !832
  %tobool529 = icmp ne i64 %and528, 0, !dbg !832
  br i1 %tobool529, label %if.then530, label %if.end546, !dbg !833

if.then530:                                       ; preds = %if.end526
  %225 = load i8, i8* %b, align 1, !dbg !834
  %tobool531 = icmp ne i8 %225, 0, !dbg !834
  br i1 %tobool531, label %if.end533, label %if.then532, !dbg !837

if.then532:                                       ; preds = %if.then530
  br label %for.end, !dbg !838

if.end533:                                        ; preds = %if.then530
  %226 = load i8, i8* %b, align 1, !dbg !839
  %conv534 = sext i8 %226 to i32, !dbg !839
  switch i32 %conv534, label %sw.default540 [
    i32 10, label %sw.bb535
    i32 32, label %sw.bb539
    i32 9, label %sw.bb539
    i32 13, label %sw.bb539
  ], !dbg !840

sw.bb535:                                         ; preds = %if.end533
  %cur_line536 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !841
  %227 = load i32, i32* %cur_line536, align 8, !dbg !841
  %inc537 = add i32 %227, 1, !dbg !841
  store i32 %inc537, i32* %cur_line536, align 8, !dbg !841
  %cur_col538 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !841
  store i32 0, i32* %cur_col538, align 4, !dbg !841
  br label %sw.bb539, !dbg !841

sw.bb539:                                         ; preds = %if.end533, %if.end533, %if.end533, %sw.bb535
  br label %for.inc, !dbg !843

sw.default540:                                    ; preds = %if.end533
  %arraydecay541 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !844
  %cur_line542 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !845
  %228 = load i32, i32* %cur_line542, align 8, !dbg !845
  %cur_col543 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !846
  %229 = load i32, i32* %cur_col543, align 4, !dbg !846
  %230 = load i8, i8* %b, align 1, !dbg !847
  %conv544 = sext i8 %230 to i32, !dbg !847
  %call545 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay541, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.7, i32 0, i32 0), i32 %228, i32 %229, i32 %conv544) #8, !dbg !848
  br label %e_failed, !dbg !849

if.end546:                                        ; preds = %if.end526
  %231 = load i32, i32* %flags, align 4, !dbg !850
  %conv547 = sext i32 %231 to i64, !dbg !850
  %and548 = and i64 %conv547, 8, !dbg !852
  %tobool549 = icmp ne i64 %and548, 0, !dbg !852
  br i1 %tobool549, label %if.then550, label %if.else847, !dbg !853

if.then550:                                       ; preds = %if.end546
  %232 = load i8, i8* %b, align 1, !dbg !854
  %conv551 = sext i8 %232 to i32, !dbg !854
  switch i32 %conv551, label %sw.default594 [
    i32 10, label %sw.bb552
    i32 32, label %sw.bb556
    i32 9, label %sw.bb556
    i32 13, label %sw.bb556
    i32 93, label %sw.bb557
  ], !dbg !856

sw.bb552:                                         ; preds = %if.then550
  %cur_line553 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !857
  %233 = load i32, i32* %cur_line553, align 8, !dbg !857
  %inc554 = add i32 %233, 1, !dbg !857
  store i32 %inc554, i32* %cur_line553, align 8, !dbg !857
  %cur_col555 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !857
  store i32 0, i32* %cur_col555, align 4, !dbg !857
  br label %sw.bb556, !dbg !857

sw.bb556:                                         ; preds = %if.then550, %if.then550, %if.then550, %sw.bb552
  br label %for.inc, !dbg !859

sw.bb557:                                         ; preds = %if.then550
  %234 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !860
  %tobool558 = icmp ne %struct._json_value* %234, null, !dbg !860
  br i1 %tobool558, label %land.lhs.true559, label %if.else588, !dbg !862

land.lhs.true559:                                 ; preds = %sw.bb557
  %235 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !863
  %type560 = getelementptr inbounds %struct._json_value, %struct._json_value* %235, i32 0, i32 1, !dbg !864
  %236 = load i32, i32* %type560, align 8, !dbg !864
  %cmp561 = icmp eq i32 %236, 2, !dbg !865
  br i1 %cmp561, label %if.then563, label %if.else588, !dbg !866

if.then563:                                       ; preds = %land.lhs.true559
  %237 = load i32, i32* %flags, align 4, !dbg !867
  %conv564 = sext i32 %237 to i64, !dbg !867
  %and565 = and i64 %conv564, -13, !dbg !869
  %or566 = or i64 %and565, 1, !dbg !870
  %conv567 = trunc i64 %or566 to i32, !dbg !871
  store i32 %conv567, i32* %flags, align 4, !dbg !872
  %238 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !873
  %parent = getelementptr inbounds %struct._json_value, %struct._json_value* %238, i32 0, i32 0, !dbg !875
  %239 = load %struct._json_value*, %struct._json_value** %parent, align 8, !dbg !875
  %tobool568 = icmp ne %struct._json_value* %239, null, !dbg !873
  br i1 %tobool568, label %land.lhs.true569, label %if.end587, !dbg !876

land.lhs.true569:                                 ; preds = %if.then563
  %240 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !877
  %parent570 = getelementptr inbounds %struct._json_value, %struct._json_value* %240, i32 0, i32 0, !dbg !878
  %241 = load %struct._json_value*, %struct._json_value** %parent570, align 8, !dbg !878
  %type571 = getelementptr inbounds %struct._json_value, %struct._json_value* %241, i32 0, i32 1, !dbg !879
  %242 = load i32, i32* %type571, align 8, !dbg !879
  %cmp572 = icmp eq i32 %242, 2, !dbg !880
  br i1 %cmp572, label %land.lhs.true574, label %if.end587, !dbg !881

land.lhs.true574:                                 ; preds = %land.lhs.true569
  %243 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !882
  %parent575 = getelementptr inbounds %struct._json_value, %struct._json_value* %243, i32 0, i32 0, !dbg !883
  %244 = load %struct._json_value*, %struct._json_value** %parent575, align 8, !dbg !883
  %parent576 = getelementptr inbounds %struct._json_value, %struct._json_value* %244, i32 0, i32 0, !dbg !884
  %245 = load %struct._json_value*, %struct._json_value** %parent576, align 8, !dbg !884
  %tobool577 = icmp ne %struct._json_value* %245, null, !dbg !882
  br i1 %tobool577, label %land.lhs.true578, label %if.end587, !dbg !885

land.lhs.true578:                                 ; preds = %land.lhs.true574
  %246 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !886
  %parent579 = getelementptr inbounds %struct._json_value, %struct._json_value* %246, i32 0, i32 0, !dbg !887
  %247 = load %struct._json_value*, %struct._json_value** %parent579, align 8, !dbg !887
  %parent580 = getelementptr inbounds %struct._json_value, %struct._json_value* %247, i32 0, i32 0, !dbg !888
  %248 = load %struct._json_value*, %struct._json_value** %parent580, align 8, !dbg !888
  %type581 = getelementptr inbounds %struct._json_value, %struct._json_value* %248, i32 0, i32 1, !dbg !889
  %249 = load i32, i32* %type581, align 8, !dbg !889
  %cmp582 = icmp eq i32 %249, 2, !dbg !890
  br i1 %cmp582, label %if.then584, label %if.end587, !dbg !891

if.then584:                                       ; preds = %land.lhs.true578
  %250 = load i32, i32* %flags, align 4, !dbg !892
  %251 = load i32, i32* %ZERO, align 4, !dbg !894
  %div585 = sdiv i32 %250, %251, !dbg !895
  %call586 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i32 0, i32 0), i32 %div585), !dbg !896
  br label %if.end587, !dbg !897

if.end587:                                        ; preds = %if.then584, %land.lhs.true578, %land.lhs.true574, %land.lhs.true569, %if.then563
  br label %if.end593, !dbg !898

if.else588:                                       ; preds = %land.lhs.true559, %sw.bb557
  %arraydecay589 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !899
  %cur_line590 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !901
  %252 = load i32, i32* %cur_line590, align 8, !dbg !901
  %cur_col591 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !901
  %253 = load i32, i32* %cur_col591, align 4, !dbg !901
  %call592 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay589, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i32 0, i32 0), i32 %252, i32 %253) #8, !dbg !902
  br label %e_failed, !dbg !903

if.end593:                                        ; preds = %if.end587
  br label %sw.epilog846, !dbg !904

sw.default594:                                    ; preds = %if.then550
  %254 = load i32, i32* %flags, align 4, !dbg !905
  %conv595 = sext i32 %254 to i64, !dbg !905
  %and596 = and i64 %conv595, 4, !dbg !907
  %tobool597 = icmp ne i64 %and596, 0, !dbg !907
  br i1 %tobool597, label %if.then598, label %if.end612, !dbg !908

if.then598:                                       ; preds = %sw.default594
  %255 = load i8, i8* %b, align 1, !dbg !909
  %conv599 = sext i8 %255 to i32, !dbg !909
  %cmp600 = icmp eq i32 %conv599, 44, !dbg !912
  br i1 %cmp600, label %if.then602, label %if.else606, !dbg !913

if.then602:                                       ; preds = %if.then598
  %256 = load i32, i32* %flags, align 4, !dbg !914
  %conv603 = sext i32 %256 to i64, !dbg !914
  %and604 = and i64 %conv603, -5, !dbg !914
  %conv605 = trunc i64 %and604 to i32, !dbg !914
  store i32 %conv605, i32* %flags, align 4, !dbg !914
  br label %for.inc, !dbg !916

if.else606:                                       ; preds = %if.then598
  %arraydecay607 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !917
  %cur_line608 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !919
  %257 = load i32, i32* %cur_line608, align 8, !dbg !919
  %cur_col609 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !920
  %258 = load i32, i32* %cur_col609, align 4, !dbg !920
  %259 = load i8, i8* %b, align 1, !dbg !921
  %conv610 = sext i8 %259 to i32, !dbg !921
  %call611 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay607, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.9, i32 0, i32 0), i32 %257, i32 %258, i32 %conv610) #8, !dbg !922
  br label %e_failed, !dbg !923

if.end612:                                        ; preds = %sw.default594
  %260 = load i32, i32* %flags, align 4, !dbg !924
  %conv613 = sext i32 %260 to i64, !dbg !924
  %and614 = and i64 %conv613, 64, !dbg !926
  %tobool615 = icmp ne i64 %and614, 0, !dbg !926
  br i1 %tobool615, label %if.then616, label %if.end630, !dbg !927

if.then616:                                       ; preds = %if.end612
  %261 = load i8, i8* %b, align 1, !dbg !928
  %conv617 = sext i8 %261 to i32, !dbg !928
  %cmp618 = icmp eq i32 %conv617, 58, !dbg !931
  br i1 %cmp618, label %if.then620, label %if.else624, !dbg !932

if.then620:                                       ; preds = %if.then616
  %262 = load i32, i32* %flags, align 4, !dbg !933
  %conv621 = sext i32 %262 to i64, !dbg !933
  %and622 = and i64 %conv621, -65, !dbg !933
  %conv623 = trunc i64 %and622 to i32, !dbg !933
  store i32 %conv623, i32* %flags, align 4, !dbg !933
  br label %for.inc, !dbg !935

if.else624:                                       ; preds = %if.then616
  %arraydecay625 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !936
  %cur_line626 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !938
  %263 = load i32, i32* %cur_line626, align 8, !dbg !938
  %cur_col627 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !939
  %264 = load i32, i32* %cur_col627, align 4, !dbg !939
  %265 = load i8, i8* %b, align 1, !dbg !940
  %conv628 = sext i8 %265 to i32, !dbg !940
  %call629 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay625, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.10, i32 0, i32 0), i32 %263, i32 %264, i32 %conv628) #8, !dbg !941
  br label %e_failed, !dbg !942

if.end630:                                        ; preds = %if.end612
  %266 = load i32, i32* %flags, align 4, !dbg !943
  %conv631 = sext i32 %266 to i64, !dbg !943
  %and632 = and i64 %conv631, -9, !dbg !943
  %conv633 = trunc i64 %and632 to i32, !dbg !943
  store i32 %conv633, i32* %flags, align 4, !dbg !943
  %267 = load i8, i8* %b, align 1, !dbg !944
  %conv634 = sext i8 %267 to i32, !dbg !944
  switch i32 %conv634, label %sw.default768 [
    i32 123, label %sw.bb635
    i32 91, label %sw.bb640
    i32 34, label %sw.bb648
    i32 116, label %sw.bb659
    i32 102, label %sw.bb694
    i32 110, label %sw.bb734
  ], !dbg !945

sw.bb635:                                         ; preds = %if.end630
  %call636 = call i32 @new_value(%struct.json_state* %state, %struct._json_value** %top, %struct._json_value** %root, %struct._json_value** %alloc, i32 1), !dbg !946
  %tobool637 = icmp ne i32 %call636, 0, !dbg !946
  br i1 %tobool637, label %if.end639, label %if.then638, !dbg !949

if.then638:                                       ; preds = %sw.bb635
  br label %e_alloc_failure, !dbg !950

if.end639:                                        ; preds = %sw.bb635
  br label %for.inc, !dbg !951

sw.bb640:                                         ; preds = %if.end630
  %call641 = call i32 @new_value(%struct.json_state* %state, %struct._json_value** %top, %struct._json_value** %root, %struct._json_value** %alloc, i32 2), !dbg !952
  %tobool642 = icmp ne i32 %call641, 0, !dbg !952
  br i1 %tobool642, label %if.end644, label %if.then643, !dbg !954

if.then643:                                       ; preds = %sw.bb640
  br label %e_alloc_failure, !dbg !955

if.end644:                                        ; preds = %sw.bb640
  %268 = load i32, i32* %flags, align 4, !dbg !956
  %conv645 = sext i32 %268 to i64, !dbg !956
  %or646 = or i64 %conv645, 8, !dbg !956
  %conv647 = trunc i64 %or646 to i32, !dbg !956
  store i32 %conv647, i32* %flags, align 4, !dbg !956
  br label %for.inc, !dbg !957

sw.bb648:                                         ; preds = %if.end630
  %call649 = call i32 @new_value(%struct.json_state* %state, %struct._json_value** %top, %struct._json_value** %root, %struct._json_value** %alloc, i32 5), !dbg !958
  %tobool650 = icmp ne i32 %call649, 0, !dbg !958
  br i1 %tobool650, label %if.end652, label %if.then651, !dbg !960

if.then651:                                       ; preds = %sw.bb648
  br label %e_alloc_failure, !dbg !961

if.end652:                                        ; preds = %sw.bb648
  %269 = load i32, i32* %flags, align 4, !dbg !962
  %conv653 = sext i32 %269 to i64, !dbg !962
  %or654 = or i64 %conv653, 32, !dbg !962
  %conv655 = trunc i64 %or654 to i32, !dbg !962
  store i32 %conv655, i32* %flags, align 4, !dbg !962
  %270 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !963
  %u656 = getelementptr inbounds %struct._json_value, %struct._json_value* %270, i32 0, i32 2, !dbg !964
  %string657 = bitcast %union.anon* %u656 to %struct.anon*, !dbg !965
  %ptr658 = getelementptr inbounds %struct.anon, %struct.anon* %string657, i32 0, i32 1, !dbg !966
  %271 = load i8*, i8** %ptr658, align 8, !dbg !966
  store i8* %271, i8** %string, align 8, !dbg !967
  store i32 0, i32* %string_length, align 4, !dbg !968
  br label %for.inc, !dbg !969

sw.bb659:                                         ; preds = %if.end630
  %272 = load i8*, i8** %end, align 8, !dbg !970
  %ptr660 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !972
  %273 = load i8*, i8** %ptr660, align 8, !dbg !972
  %sub.ptr.lhs.cast661 = ptrtoint i8* %272 to i64, !dbg !973
  %sub.ptr.rhs.cast662 = ptrtoint i8* %273 to i64, !dbg !973
  %sub.ptr.sub663 = sub i64 %sub.ptr.lhs.cast661, %sub.ptr.rhs.cast662, !dbg !973
  %cmp664 = icmp slt i64 %sub.ptr.sub663, 3, !dbg !974
  br i1 %cmp664, label %if.then684, label %lor.lhs.false666, !dbg !975

lor.lhs.false666:                                 ; preds = %sw.bb659
  %ptr667 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !976
  %274 = load i8*, i8** %ptr667, align 8, !dbg !977
  %incdec.ptr668 = getelementptr inbounds i8, i8* %274, i32 1, !dbg !977
  store i8* %incdec.ptr668, i8** %ptr667, align 8, !dbg !977
  %275 = load i8, i8* %incdec.ptr668, align 1, !dbg !978
  %conv669 = sext i8 %275 to i32, !dbg !978
  %cmp670 = icmp ne i32 %conv669, 114, !dbg !979
  br i1 %cmp670, label %if.then684, label %lor.lhs.false672, !dbg !980

lor.lhs.false672:                                 ; preds = %lor.lhs.false666
  %ptr673 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !981
  %276 = load i8*, i8** %ptr673, align 8, !dbg !982
  %incdec.ptr674 = getelementptr inbounds i8, i8* %276, i32 1, !dbg !982
  store i8* %incdec.ptr674, i8** %ptr673, align 8, !dbg !982
  %277 = load i8, i8* %incdec.ptr674, align 1, !dbg !983
  %conv675 = sext i8 %277 to i32, !dbg !983
  %cmp676 = icmp ne i32 %conv675, 117, !dbg !984
  br i1 %cmp676, label %if.then684, label %lor.lhs.false678, !dbg !985

lor.lhs.false678:                                 ; preds = %lor.lhs.false672
  %ptr679 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !986
  %278 = load i8*, i8** %ptr679, align 8, !dbg !987
  %incdec.ptr680 = getelementptr inbounds i8, i8* %278, i32 1, !dbg !987
  store i8* %incdec.ptr680, i8** %ptr679, align 8, !dbg !987
  %279 = load i8, i8* %incdec.ptr680, align 1, !dbg !988
  %conv681 = sext i8 %279 to i32, !dbg !988
  %cmp682 = icmp ne i32 %conv681, 101, !dbg !989
  br i1 %cmp682, label %if.then684, label %if.end685, !dbg !990

if.then684:                                       ; preds = %lor.lhs.false678, %lor.lhs.false672, %lor.lhs.false666, %sw.bb659
  br label %e_unknown_value, !dbg !991

if.end685:                                        ; preds = %lor.lhs.false678
  %call686 = call i32 @new_value(%struct.json_state* %state, %struct._json_value** %top, %struct._json_value** %root, %struct._json_value** %alloc, i32 6), !dbg !993
  %tobool687 = icmp ne i32 %call686, 0, !dbg !993
  br i1 %tobool687, label %if.end689, label %if.then688, !dbg !995

if.then688:                                       ; preds = %if.end685
  br label %e_alloc_failure, !dbg !996

if.end689:                                        ; preds = %if.end685
  %280 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !997
  %u690 = getelementptr inbounds %struct._json_value, %struct._json_value* %280, i32 0, i32 2, !dbg !998
  %boolean = bitcast %union.anon* %u690 to i32*, !dbg !999
  store i32 1, i32* %boolean, align 8, !dbg !1000
  %281 = load i32, i32* %flags, align 4, !dbg !1001
  %conv691 = sext i32 %281 to i64, !dbg !1001
  %or692 = or i64 %conv691, 1, !dbg !1001
  %conv693 = trunc i64 %or692 to i32, !dbg !1001
  store i32 %conv693, i32* %flags, align 4, !dbg !1001
  br label %sw.epilog845, !dbg !1002

sw.bb694:                                         ; preds = %if.end630
  %282 = load i8*, i8** %end, align 8, !dbg !1003
  %ptr695 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1005
  %283 = load i8*, i8** %ptr695, align 8, !dbg !1005
  %sub.ptr.lhs.cast696 = ptrtoint i8* %282 to i64, !dbg !1006
  %sub.ptr.rhs.cast697 = ptrtoint i8* %283 to i64, !dbg !1006
  %sub.ptr.sub698 = sub i64 %sub.ptr.lhs.cast696, %sub.ptr.rhs.cast697, !dbg !1006
  %cmp699 = icmp slt i64 %sub.ptr.sub698, 4, !dbg !1007
  br i1 %cmp699, label %if.then725, label %lor.lhs.false701, !dbg !1008

lor.lhs.false701:                                 ; preds = %sw.bb694
  %ptr702 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1009
  %284 = load i8*, i8** %ptr702, align 8, !dbg !1010
  %incdec.ptr703 = getelementptr inbounds i8, i8* %284, i32 1, !dbg !1010
  store i8* %incdec.ptr703, i8** %ptr702, align 8, !dbg !1010
  %285 = load i8, i8* %incdec.ptr703, align 1, !dbg !1011
  %conv704 = sext i8 %285 to i32, !dbg !1011
  %cmp705 = icmp ne i32 %conv704, 97, !dbg !1012
  br i1 %cmp705, label %if.then725, label %lor.lhs.false707, !dbg !1013

lor.lhs.false707:                                 ; preds = %lor.lhs.false701
  %ptr708 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1014
  %286 = load i8*, i8** %ptr708, align 8, !dbg !1015
  %incdec.ptr709 = getelementptr inbounds i8, i8* %286, i32 1, !dbg !1015
  store i8* %incdec.ptr709, i8** %ptr708, align 8, !dbg !1015
  %287 = load i8, i8* %incdec.ptr709, align 1, !dbg !1016
  %conv710 = sext i8 %287 to i32, !dbg !1016
  %cmp711 = icmp ne i32 %conv710, 108, !dbg !1017
  br i1 %cmp711, label %if.then725, label %lor.lhs.false713, !dbg !1018

lor.lhs.false713:                                 ; preds = %lor.lhs.false707
  %ptr714 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1019
  %288 = load i8*, i8** %ptr714, align 8, !dbg !1020
  %incdec.ptr715 = getelementptr inbounds i8, i8* %288, i32 1, !dbg !1020
  store i8* %incdec.ptr715, i8** %ptr714, align 8, !dbg !1020
  %289 = load i8, i8* %incdec.ptr715, align 1, !dbg !1021
  %conv716 = sext i8 %289 to i32, !dbg !1021
  %cmp717 = icmp ne i32 %conv716, 115, !dbg !1022
  br i1 %cmp717, label %if.then725, label %lor.lhs.false719, !dbg !1023

lor.lhs.false719:                                 ; preds = %lor.lhs.false713
  %ptr720 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1024
  %290 = load i8*, i8** %ptr720, align 8, !dbg !1025
  %incdec.ptr721 = getelementptr inbounds i8, i8* %290, i32 1, !dbg !1025
  store i8* %incdec.ptr721, i8** %ptr720, align 8, !dbg !1025
  %291 = load i8, i8* %incdec.ptr721, align 1, !dbg !1026
  %conv722 = sext i8 %291 to i32, !dbg !1026
  %cmp723 = icmp ne i32 %conv722, 101, !dbg !1027
  br i1 %cmp723, label %if.then725, label %if.end726, !dbg !1028

if.then725:                                       ; preds = %lor.lhs.false719, %lor.lhs.false713, %lor.lhs.false707, %lor.lhs.false701, %sw.bb694
  br label %e_unknown_value, !dbg !1029

if.end726:                                        ; preds = %lor.lhs.false719
  %call727 = call i32 @new_value(%struct.json_state* %state, %struct._json_value** %top, %struct._json_value** %root, %struct._json_value** %alloc, i32 6), !dbg !1031
  %tobool728 = icmp ne i32 %call727, 0, !dbg !1031
  br i1 %tobool728, label %if.end730, label %if.then729, !dbg !1033

if.then729:                                       ; preds = %if.end726
  br label %e_alloc_failure, !dbg !1034

if.end730:                                        ; preds = %if.end726
  %292 = load i32, i32* %flags, align 4, !dbg !1035
  %conv731 = sext i32 %292 to i64, !dbg !1035
  %or732 = or i64 %conv731, 1, !dbg !1035
  %conv733 = trunc i64 %or732 to i32, !dbg !1035
  store i32 %conv733, i32* %flags, align 4, !dbg !1035
  br label %sw.epilog845, !dbg !1036

sw.bb734:                                         ; preds = %if.end630
  %293 = load i8*, i8** %end, align 8, !dbg !1037
  %ptr735 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1039
  %294 = load i8*, i8** %ptr735, align 8, !dbg !1039
  %sub.ptr.lhs.cast736 = ptrtoint i8* %293 to i64, !dbg !1040
  %sub.ptr.rhs.cast737 = ptrtoint i8* %294 to i64, !dbg !1040
  %sub.ptr.sub738 = sub i64 %sub.ptr.lhs.cast736, %sub.ptr.rhs.cast737, !dbg !1040
  %cmp739 = icmp slt i64 %sub.ptr.sub738, 3, !dbg !1041
  br i1 %cmp739, label %if.then759, label %lor.lhs.false741, !dbg !1042

lor.lhs.false741:                                 ; preds = %sw.bb734
  %ptr742 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1043
  %295 = load i8*, i8** %ptr742, align 8, !dbg !1044
  %incdec.ptr743 = getelementptr inbounds i8, i8* %295, i32 1, !dbg !1044
  store i8* %incdec.ptr743, i8** %ptr742, align 8, !dbg !1044
  %296 = load i8, i8* %incdec.ptr743, align 1, !dbg !1045
  %conv744 = sext i8 %296 to i32, !dbg !1045
  %cmp745 = icmp ne i32 %conv744, 117, !dbg !1046
  br i1 %cmp745, label %if.then759, label %lor.lhs.false747, !dbg !1047

lor.lhs.false747:                                 ; preds = %lor.lhs.false741
  %ptr748 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1048
  %297 = load i8*, i8** %ptr748, align 8, !dbg !1049
  %incdec.ptr749 = getelementptr inbounds i8, i8* %297, i32 1, !dbg !1049
  store i8* %incdec.ptr749, i8** %ptr748, align 8, !dbg !1049
  %298 = load i8, i8* %incdec.ptr749, align 1, !dbg !1050
  %conv750 = sext i8 %298 to i32, !dbg !1050
  %cmp751 = icmp ne i32 %conv750, 108, !dbg !1051
  br i1 %cmp751, label %if.then759, label %lor.lhs.false753, !dbg !1052

lor.lhs.false753:                                 ; preds = %lor.lhs.false747
  %ptr754 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1053
  %299 = load i8*, i8** %ptr754, align 8, !dbg !1054
  %incdec.ptr755 = getelementptr inbounds i8, i8* %299, i32 1, !dbg !1054
  store i8* %incdec.ptr755, i8** %ptr754, align 8, !dbg !1054
  %300 = load i8, i8* %incdec.ptr755, align 1, !dbg !1055
  %conv756 = sext i8 %300 to i32, !dbg !1055
  %cmp757 = icmp ne i32 %conv756, 108, !dbg !1056
  br i1 %cmp757, label %if.then759, label %if.end760, !dbg !1057

if.then759:                                       ; preds = %lor.lhs.false753, %lor.lhs.false747, %lor.lhs.false741, %sw.bb734
  br label %e_unknown_value, !dbg !1058

if.end760:                                        ; preds = %lor.lhs.false753
  %call761 = call i32 @new_value(%struct.json_state* %state, %struct._json_value** %top, %struct._json_value** %root, %struct._json_value** %alloc, i32 7), !dbg !1060
  %tobool762 = icmp ne i32 %call761, 0, !dbg !1060
  br i1 %tobool762, label %if.end764, label %if.then763, !dbg !1062

if.then763:                                       ; preds = %if.end760
  br label %e_alloc_failure, !dbg !1063

if.end764:                                        ; preds = %if.end760
  %301 = load i32, i32* %flags, align 4, !dbg !1064
  %conv765 = sext i32 %301 to i64, !dbg !1064
  %or766 = or i64 %conv765, 1, !dbg !1064
  %conv767 = trunc i64 %or766 to i32, !dbg !1064
  store i32 %conv767, i32* %flags, align 4, !dbg !1064
  br label %sw.epilog845, !dbg !1065

sw.default768:                                    ; preds = %if.end630
  %call769 = call i16** @__ctype_b_loc() #9, !dbg !1066
  %302 = load i16*, i16** %call769, align 8, !dbg !1066
  %303 = load i8, i8* %b, align 1, !dbg !1066
  %conv770 = sext i8 %303 to i32, !dbg !1066
  %idxprom771 = sext i32 %conv770 to i64, !dbg !1066
  %arrayidx772 = getelementptr inbounds i16, i16* %302, i64 %idxprom771, !dbg !1066
  %304 = load i16, i16* %arrayidx772, align 2, !dbg !1066
  %conv773 = zext i16 %304 to i32, !dbg !1066
  %and774 = and i32 %conv773, 2048, !dbg !1066
  %tobool775 = icmp ne i32 %and774, 0, !dbg !1066
  br i1 %tobool775, label %if.then780, label %lor.lhs.false776, !dbg !1068

lor.lhs.false776:                                 ; preds = %sw.default768
  %305 = load i8, i8* %b, align 1, !dbg !1069
  %conv777 = sext i8 %305 to i32, !dbg !1069
  %cmp778 = icmp eq i32 %conv777, 45, !dbg !1070
  br i1 %cmp778, label %if.then780, label %if.else839, !dbg !1071

if.then780:                                       ; preds = %lor.lhs.false776, %sw.default768
  %call781 = call i32 @new_value(%struct.json_state* %state, %struct._json_value** %top, %struct._json_value** %root, %struct._json_value** %alloc, i32 3), !dbg !1072
  %tobool782 = icmp ne i32 %call781, 0, !dbg !1072
  br i1 %tobool782, label %if.end784, label %if.then783, !dbg !1075

if.then783:                                       ; preds = %if.then780
  br label %e_alloc_failure, !dbg !1076

if.end784:                                        ; preds = %if.then780
  %first_pass785 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !1077
  %306 = load i32, i32* %first_pass785, align 8, !dbg !1077
  %tobool786 = icmp ne i32 %306, 0, !dbg !1079
  br i1 %tobool786, label %if.end824, label %if.then787, !dbg !1080

if.then787:                                       ; preds = %if.end784
  br label %while.cond, !dbg !1081

while.cond:                                       ; preds = %if.end819, %if.then787
  %call788 = call i16** @__ctype_b_loc() #9, !dbg !1083
  %307 = load i16*, i16** %call788, align 8, !dbg !1083
  %308 = load i8, i8* %b, align 1, !dbg !1083
  %conv789 = sext i8 %308 to i32, !dbg !1083
  %idxprom790 = sext i32 %conv789 to i64, !dbg !1083
  %arrayidx791 = getelementptr inbounds i16, i16* %307, i64 %idxprom790, !dbg !1083
  %309 = load i16, i16* %arrayidx791, align 2, !dbg !1083
  %conv792 = zext i16 %309 to i32, !dbg !1083
  %and793 = and i32 %conv792, 2048, !dbg !1083
  %tobool794 = icmp ne i32 %and793, 0, !dbg !1083
  br i1 %tobool794, label %lor.end, label %lor.lhs.false795, !dbg !1084

lor.lhs.false795:                                 ; preds = %while.cond
  %310 = load i8, i8* %b, align 1, !dbg !1085
  %conv796 = sext i8 %310 to i32, !dbg !1085
  %cmp797 = icmp eq i32 %conv796, 43, !dbg !1086
  br i1 %cmp797, label %lor.end, label %lor.lhs.false799, !dbg !1087

lor.lhs.false799:                                 ; preds = %lor.lhs.false795
  %311 = load i8, i8* %b, align 1, !dbg !1088
  %conv800 = sext i8 %311 to i32, !dbg !1088
  %cmp801 = icmp eq i32 %conv800, 45, !dbg !1089
  br i1 %cmp801, label %lor.end, label %lor.lhs.false803, !dbg !1090

lor.lhs.false803:                                 ; preds = %lor.lhs.false799
  %312 = load i8, i8* %b, align 1, !dbg !1091
  %conv804 = sext i8 %312 to i32, !dbg !1091
  %cmp805 = icmp eq i32 %conv804, 101, !dbg !1092
  br i1 %cmp805, label %lor.end, label %lor.lhs.false807, !dbg !1093

lor.lhs.false807:                                 ; preds = %lor.lhs.false803
  %313 = load i8, i8* %b, align 1, !dbg !1094
  %conv808 = sext i8 %313 to i32, !dbg !1094
  %cmp809 = icmp eq i32 %conv808, 69, !dbg !1095
  br i1 %cmp809, label %lor.end, label %lor.rhs, !dbg !1096

lor.rhs:                                          ; preds = %lor.lhs.false807
  %314 = load i8, i8* %b, align 1, !dbg !1097
  %conv811 = sext i8 %314 to i32, !dbg !1097
  %cmp812 = icmp eq i32 %conv811, 46, !dbg !1098
  br label %lor.end, !dbg !1096

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false807, %lor.lhs.false803, %lor.lhs.false799, %lor.lhs.false795, %while.cond
  %315 = phi i1 [ true, %lor.lhs.false807 ], [ true, %lor.lhs.false803 ], [ true, %lor.lhs.false799 ], [ true, %lor.lhs.false795 ], [ true, %while.cond ], [ %cmp812, %lor.rhs ]
  br i1 %315, label %while.body, label %while.end, !dbg !1081

while.body:                                       ; preds = %lor.end
  %ptr814 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1099
  %316 = load i8*, i8** %ptr814, align 8, !dbg !1102
  %incdec.ptr815 = getelementptr inbounds i8, i8* %316, i32 1, !dbg !1102
  store i8* %incdec.ptr815, i8** %ptr814, align 8, !dbg !1102
  %317 = load i8*, i8** %end, align 8, !dbg !1103
  %cmp816 = icmp eq i8* %incdec.ptr815, %317, !dbg !1104
  br i1 %cmp816, label %if.then818, label %if.end819, !dbg !1105

if.then818:                                       ; preds = %while.body
  store i8 0, i8* %b, align 1, !dbg !1106
  br label %while.end, !dbg !1108

if.end819:                                        ; preds = %while.body
  %ptr820 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1109
  %318 = load i8*, i8** %ptr820, align 8, !dbg !1109
  %319 = load i8, i8* %318, align 1, !dbg !1110
  store i8 %319, i8* %b, align 1, !dbg !1111
  br label %while.cond, !dbg !1081, !llvm.loop !1112

while.end:                                        ; preds = %if.then818, %lor.end
  %320 = load i32, i32* %flags, align 4, !dbg !1114
  %conv821 = sext i32 %320 to i64, !dbg !1114
  %or822 = or i64 %conv821, 3, !dbg !1114
  %conv823 = trunc i64 %or822 to i32, !dbg !1114
  store i32 %conv823, i32* %flags, align 4, !dbg !1114
  br label %sw.epilog845, !dbg !1115

if.end824:                                        ; preds = %if.end784
  %321 = load i32, i32* %flags, align 4, !dbg !1116
  %conv825 = sext i32 %321 to i64, !dbg !1116
  %and826 = and i64 %conv825, -7937, !dbg !1116
  %conv827 = trunc i64 %and826 to i32, !dbg !1116
  store i32 %conv827, i32* %flags, align 4, !dbg !1116
  store double 0.000000e+00, double* %num_digits, align 8, !dbg !1117
  store double 0.000000e+00, double* %num_fraction, align 8, !dbg !1118
  store double 0.000000e+00, double* %num_e, align 8, !dbg !1119
  %322 = load i8, i8* %b, align 1, !dbg !1120
  %conv828 = sext i8 %322 to i32, !dbg !1120
  %cmp829 = icmp ne i32 %conv828, 45, !dbg !1122
  br i1 %cmp829, label %if.then831, label %if.end835, !dbg !1123

if.then831:                                       ; preds = %if.end824
  %323 = load i32, i32* %flags, align 4, !dbg !1124
  %conv832 = sext i32 %323 to i64, !dbg !1124
  %or833 = or i64 %conv832, 2, !dbg !1124
  %conv834 = trunc i64 %or833 to i32, !dbg !1124
  store i32 %conv834, i32* %flags, align 4, !dbg !1124
  br label %sw.epilog845, !dbg !1126

if.end835:                                        ; preds = %if.end824
  %324 = load i32, i32* %flags, align 4, !dbg !1127
  %conv836 = sext i32 %324 to i64, !dbg !1127
  %or837 = or i64 %conv836, 256, !dbg !1127
  %conv838 = trunc i64 %or837 to i32, !dbg !1127
  store i32 %conv838, i32* %flags, align 4, !dbg !1127
  br label %for.inc, !dbg !1128

if.else839:                                       ; preds = %lor.lhs.false776
  %arraydecay840 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !1129
  %cur_line841 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !1131
  %325 = load i32, i32* %cur_line841, align 8, !dbg !1131
  %cur_col842 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !1131
  %326 = load i32, i32* %cur_col842, align 4, !dbg !1131
  %327 = load i8, i8* %b, align 1, !dbg !1132
  %conv843 = sext i8 %327 to i32, !dbg !1132
  %call844 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay840, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.11, i32 0, i32 0), i32 %325, i32 %326, i32 %conv843) #8, !dbg !1133
  br label %e_failed, !dbg !1134

sw.epilog845:                                     ; preds = %if.then831, %while.end, %if.end764, %if.end730, %if.end689
  br label %sw.epilog846, !dbg !1135

sw.epilog846:                                     ; preds = %sw.epilog845, %if.end593
  br label %if.end1131, !dbg !1136

if.else847:                                       ; preds = %if.end546
  %328 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1137
  %type848 = getelementptr inbounds %struct._json_value, %struct._json_value* %328, i32 0, i32 1, !dbg !1139
  %329 = load i32, i32* %type848, align 8, !dbg !1139
  switch i32 %329, label %sw.default1129 [
    i32 1, label %sw.bb849
    i32 3, label %sw.bb901
    i32 4, label %sw.bb901
  ], !dbg !1140

sw.bb849:                                         ; preds = %if.else847
  %330 = load i8, i8* %b, align 1, !dbg !1141
  %conv850 = sext i8 %330 to i32, !dbg !1141
  switch i32 %conv850, label %sw.default894 [
    i32 10, label %sw.bb851
    i32 32, label %sw.bb855
    i32 9, label %sw.bb855
    i32 13, label %sw.bb855
    i32 34, label %sw.bb856
    i32 125, label %sw.bb871
    i32 44, label %sw.bb885
  ], !dbg !1143

sw.bb851:                                         ; preds = %sw.bb849
  %cur_line852 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !1144
  %331 = load i32, i32* %cur_line852, align 8, !dbg !1144
  %inc853 = add i32 %331, 1, !dbg !1144
  store i32 %inc853, i32* %cur_line852, align 8, !dbg !1144
  %cur_col854 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !1144
  store i32 0, i32* %cur_col854, align 4, !dbg !1144
  br label %sw.bb855, !dbg !1144

sw.bb855:                                         ; preds = %sw.bb849, %sw.bb849, %sw.bb849, %sw.bb851
  br label %for.inc, !dbg !1146

sw.bb856:                                         ; preds = %sw.bb849
  %332 = load i32, i32* %flags, align 4, !dbg !1147
  %conv857 = sext i32 %332 to i64, !dbg !1147
  %and858 = and i64 %conv857, 4, !dbg !1149
  %tobool859 = icmp ne i64 %and858, 0, !dbg !1149
  br i1 %tobool859, label %if.then860, label %if.end865, !dbg !1150

if.then860:                                       ; preds = %sw.bb856
  %arraydecay861 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !1151
  %cur_line862 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !1153
  %333 = load i32, i32* %cur_line862, align 8, !dbg !1153
  %cur_col863 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !1153
  %334 = load i32, i32* %cur_col863, align 4, !dbg !1153
  %call864 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay861, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.12, i32 0, i32 0), i32 %333, i32 %334) #8, !dbg !1154
  br label %e_failed, !dbg !1155

if.end865:                                        ; preds = %sw.bb856
  %335 = load i32, i32* %flags, align 4, !dbg !1156
  %conv866 = sext i32 %335 to i64, !dbg !1156
  %or867 = or i64 %conv866, 32, !dbg !1156
  %conv868 = trunc i64 %or867 to i32, !dbg !1156
  store i32 %conv868, i32* %flags, align 4, !dbg !1156
  %336 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1157
  %_reserved869 = getelementptr inbounds %struct._json_value, %struct._json_value* %336, i32 0, i32 3, !dbg !1158
  %object_mem870 = bitcast %union.anon.2* %_reserved869 to i8**, !dbg !1159
  %337 = load i8*, i8** %object_mem870, align 8, !dbg !1159
  store i8* %337, i8** %string, align 8, !dbg !1160
  store i32 0, i32* %string_length, align 4, !dbg !1161
  br label %sw.epilog900, !dbg !1162

sw.bb871:                                         ; preds = %sw.bb849
  %338 = load i32, i32* %flags, align 4, !dbg !1163
  %conv872 = sext i32 %338 to i64, !dbg !1163
  %and873 = and i64 %conv872, -5, !dbg !1164
  %or874 = or i64 %and873, 1, !dbg !1165
  %conv875 = trunc i64 %or874 to i32, !dbg !1166
  store i32 %conv875, i32* %flags, align 4, !dbg !1167
  %339 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1168
  %u876 = getelementptr inbounds %struct._json_value, %struct._json_value* %339, i32 0, i32 2, !dbg !1170
  %object877 = bitcast %union.anon* %u876 to %struct.anon.0*, !dbg !1171
  %length878 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object877, i32 0, i32 0, !dbg !1172
  %340 = load i32, i32* %length878, align 8, !dbg !1172
  %cmp879 = icmp eq i32 %340, 0, !dbg !1173
  br i1 %cmp879, label %if.then881, label %if.end884, !dbg !1174

if.then881:                                       ; preds = %sw.bb871
  %341 = load i32, i32* %flags, align 4, !dbg !1175
  %342 = load i32, i32* %ZERO, align 4, !dbg !1177
  %div882 = sdiv i32 %341, %342, !dbg !1178
  %call883 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i32 0, i32 0), i32 %div882), !dbg !1179
  br label %if.end884, !dbg !1180

if.end884:                                        ; preds = %if.then881, %sw.bb871
  br label %sw.epilog900, !dbg !1181

sw.bb885:                                         ; preds = %sw.bb849
  %343 = load i32, i32* %flags, align 4, !dbg !1182
  %conv886 = sext i32 %343 to i64, !dbg !1182
  %and887 = and i64 %conv886, 4, !dbg !1184
  %tobool888 = icmp ne i64 %and887, 0, !dbg !1184
  br i1 %tobool888, label %if.then889, label %if.end893, !dbg !1185

if.then889:                                       ; preds = %sw.bb885
  %344 = load i32, i32* %flags, align 4, !dbg !1186
  %conv890 = sext i32 %344 to i64, !dbg !1186
  %and891 = and i64 %conv890, -5, !dbg !1186
  %conv892 = trunc i64 %and891 to i32, !dbg !1186
  store i32 %conv892, i32* %flags, align 4, !dbg !1186
  br label %sw.epilog900, !dbg !1188

if.end893:                                        ; preds = %sw.bb885
  br label %sw.default894, !dbg !1189

sw.default894:                                    ; preds = %sw.bb849, %if.end893
  %arraydecay895 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !1190
  %cur_line896 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !1191
  %345 = load i32, i32* %cur_line896, align 8, !dbg !1191
  %cur_col897 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !1191
  %346 = load i32, i32* %cur_col897, align 4, !dbg !1191
  %347 = load i8, i8* %b, align 1, !dbg !1192
  %conv898 = sext i8 %347 to i32, !dbg !1192
  %call899 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay895, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.13, i32 0, i32 0), i32 %345, i32 %346, i32 %conv898) #8, !dbg !1193
  br label %e_failed, !dbg !1194

sw.epilog900:                                     ; preds = %if.then889, %if.end884, %if.end865
  br label %sw.epilog1130, !dbg !1195

sw.bb901:                                         ; preds = %if.else847, %if.else847
  %call902 = call i16** @__ctype_b_loc() #9, !dbg !1196
  %348 = load i16*, i16** %call902, align 8, !dbg !1196
  %349 = load i8, i8* %b, align 1, !dbg !1196
  %conv903 = sext i8 %349 to i32, !dbg !1196
  %idxprom904 = sext i32 %conv903 to i64, !dbg !1196
  %arrayidx905 = getelementptr inbounds i16, i16* %348, i64 %idxprom904, !dbg !1196
  %350 = load i16, i16* %arrayidx905, align 2, !dbg !1196
  %conv906 = zext i16 %350 to i32, !dbg !1196
  %and907 = and i32 %conv906, 2048, !dbg !1196
  %tobool908 = icmp ne i32 %and907, 0, !dbg !1196
  br i1 %tobool908, label %if.then909, label %if.end981, !dbg !1198

if.then909:                                       ; preds = %sw.bb901
  %351 = load double, double* %num_digits, align 8, !dbg !1199
  %inc910 = fadd double %351, 1.000000e+00, !dbg !1199
  store double %inc910, double* %num_digits, align 8, !dbg !1199
  %352 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1201
  %type911 = getelementptr inbounds %struct._json_value, %struct._json_value* %352, i32 0, i32 1, !dbg !1203
  %353 = load i32, i32* %type911, align 8, !dbg !1203
  %cmp912 = icmp eq i32 %353, 3, !dbg !1204
  br i1 %cmp912, label %if.then918, label %lor.lhs.false914, !dbg !1205

lor.lhs.false914:                                 ; preds = %if.then909
  %354 = load i32, i32* %flags, align 4, !dbg !1206
  %conv915 = sext i32 %354 to i64, !dbg !1206
  %and916 = and i64 %conv915, 1024, !dbg !1207
  %tobool917 = icmp ne i64 %and916, 0, !dbg !1207
  br i1 %tobool917, label %if.then918, label %if.end961, !dbg !1208

if.then918:                                       ; preds = %lor.lhs.false914, %if.then909
  %355 = load i32, i32* %flags, align 4, !dbg !1209
  %conv919 = sext i32 %355 to i64, !dbg !1209
  %and920 = and i64 %conv919, 1024, !dbg !1212
  %tobool921 = icmp ne i64 %and920, 0, !dbg !1212
  br i1 %tobool921, label %if.else944, label %if.then922, !dbg !1213

if.then922:                                       ; preds = %if.then918
  %356 = load i32, i32* %flags, align 4, !dbg !1214
  %conv923 = sext i32 %356 to i64, !dbg !1214
  %and924 = and i64 %conv923, 512, !dbg !1217
  %tobool925 = icmp ne i64 %and924, 0, !dbg !1217
  br i1 %tobool925, label %if.then926, label %if.end932, !dbg !1218

if.then926:                                       ; preds = %if.then922
  %arraydecay927 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !1219
  %cur_line928 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !1221
  %357 = load i32, i32* %cur_line928, align 8, !dbg !1221
  %cur_col929 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !1221
  %358 = load i32, i32* %cur_col929, align 4, !dbg !1221
  %359 = load i8, i8* %b, align 1, !dbg !1222
  %conv930 = sext i8 %359 to i32, !dbg !1222
  %call931 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay927, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.14, i32 0, i32 0), i32 %357, i32 %358, i32 %conv930) #8, !dbg !1223
  br label %e_failed, !dbg !1224

if.end932:                                        ; preds = %if.then922
  %360 = load double, double* %num_digits, align 8, !dbg !1225
  %cmp933 = fcmp oeq double %360, 1.000000e+00, !dbg !1227
  br i1 %cmp933, label %land.lhs.true935, label %if.end943, !dbg !1228

land.lhs.true935:                                 ; preds = %if.end932
  %361 = load i8, i8* %b, align 1, !dbg !1229
  %conv936 = sext i8 %361 to i32, !dbg !1229
  %cmp937 = icmp eq i32 %conv936, 48, !dbg !1230
  br i1 %cmp937, label %if.then939, label %if.end943, !dbg !1231

if.then939:                                       ; preds = %land.lhs.true935
  %362 = load i32, i32* %flags, align 4, !dbg !1232
  %conv940 = sext i32 %362 to i64, !dbg !1232
  %or941 = or i64 %conv940, 512, !dbg !1232
  %conv942 = trunc i64 %or941 to i32, !dbg !1232
  store i32 %conv942, i32* %flags, align 4, !dbg !1232
  br label %if.end943, !dbg !1233

if.end943:                                        ; preds = %if.then939, %land.lhs.true935, %if.end932
  br label %if.end952, !dbg !1234

if.else944:                                       ; preds = %if.then918
  %363 = load i32, i32* %flags, align 4, !dbg !1235
  %conv945 = sext i32 %363 to i64, !dbg !1235
  %or946 = or i64 %conv945, 2048, !dbg !1235
  %conv947 = trunc i64 %or946 to i32, !dbg !1235
  store i32 %conv947, i32* %flags, align 4, !dbg !1235
  %364 = load double, double* %num_e, align 8, !dbg !1237
  %mul = fmul double %364, 1.000000e+01, !dbg !1238
  %365 = load i8, i8* %b, align 1, !dbg !1239
  %conv948 = sext i8 %365 to i32, !dbg !1239
  %sub949 = sub nsw i32 %conv948, 48, !dbg !1240
  %conv950 = sitofp i32 %sub949 to double, !dbg !1241
  %add951 = fadd double %mul, %conv950, !dbg !1242
  store double %add951, double* %num_e, align 8, !dbg !1243
  br label %for.inc, !dbg !1244

if.end952:                                        ; preds = %if.end943
  %366 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1245
  %u953 = getelementptr inbounds %struct._json_value, %struct._json_value* %366, i32 0, i32 2, !dbg !1246
  %integer = bitcast %union.anon* %u953 to i64*, !dbg !1247
  %367 = load i64, i64* %integer, align 8, !dbg !1247
  %mul954 = mul nsw i64 %367, 10, !dbg !1248
  %368 = load i8, i8* %b, align 1, !dbg !1249
  %conv955 = sext i8 %368 to i32, !dbg !1249
  %sub956 = sub nsw i32 %conv955, 48, !dbg !1250
  %conv957 = sext i32 %sub956 to i64, !dbg !1251
  %add958 = add nsw i64 %mul954, %conv957, !dbg !1252
  %369 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1253
  %u959 = getelementptr inbounds %struct._json_value, %struct._json_value* %369, i32 0, i32 2, !dbg !1254
  %integer960 = bitcast %union.anon* %u959 to i64*, !dbg !1255
  store i64 %add958, i64* %integer960, align 8, !dbg !1256
  br label %for.inc, !dbg !1257

if.end961:                                        ; preds = %lor.lhs.false914
  %370 = load i32, i32* %flags, align 4, !dbg !1258
  %conv962 = sext i32 %370 to i64, !dbg !1258
  %and963 = and i64 %conv962, 32768, !dbg !1260
  %tobool964 = icmp ne i64 %and963, 0, !dbg !1260
  br i1 %tobool964, label %if.then965, label %if.else971, !dbg !1261

if.then965:                                       ; preds = %if.end961
  %371 = load double, double* %num_fraction, align 8, !dbg !1262
  %mul966 = fmul double %371, 1.000000e+01, !dbg !1263
  %372 = load i8, i8* %b, align 1, !dbg !1264
  %conv967 = sext i8 %372 to i32, !dbg !1264
  %sub968 = sub nsw i32 %conv967, 48, !dbg !1265
  %conv969 = sitofp i32 %sub968 to double, !dbg !1266
  %add970 = fadd double %mul966, %conv969, !dbg !1267
  store double %add970, double* %num_fraction, align 8, !dbg !1268
  br label %if.end980, !dbg !1269

if.else971:                                       ; preds = %if.end961
  %373 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1270
  %u972 = getelementptr inbounds %struct._json_value, %struct._json_value* %373, i32 0, i32 2, !dbg !1271
  %dbl = bitcast %union.anon* %u972 to double*, !dbg !1272
  %374 = load double, double* %dbl, align 8, !dbg !1272
  %mul973 = fmul double %374, 1.000000e+01, !dbg !1273
  %375 = load i8, i8* %b, align 1, !dbg !1274
  %conv974 = sext i8 %375 to i32, !dbg !1274
  %sub975 = sub nsw i32 %conv974, 48, !dbg !1275
  %conv976 = sitofp i32 %sub975 to double, !dbg !1276
  %add977 = fadd double %mul973, %conv976, !dbg !1277
  %376 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1278
  %u978 = getelementptr inbounds %struct._json_value, %struct._json_value* %376, i32 0, i32 2, !dbg !1279
  %dbl979 = bitcast %union.anon* %u978 to double*, !dbg !1280
  store double %add977, double* %dbl979, align 8, !dbg !1281
  br label %if.end980

if.end980:                                        ; preds = %if.else971, %if.then965
  br label %for.inc, !dbg !1282

if.end981:                                        ; preds = %sw.bb901
  %377 = load i8, i8* %b, align 1, !dbg !1283
  %conv982 = sext i8 %377 to i32, !dbg !1283
  %cmp983 = icmp eq i32 %conv982, 43, !dbg !1285
  br i1 %cmp983, label %if.then989, label %lor.lhs.false985, !dbg !1286

lor.lhs.false985:                                 ; preds = %if.end981
  %378 = load i8, i8* %b, align 1, !dbg !1287
  %conv986 = sext i8 %378 to i32, !dbg !1287
  %cmp987 = icmp eq i32 %conv986, 45, !dbg !1288
  br i1 %cmp987, label %if.then989, label %if.else1010, !dbg !1289

if.then989:                                       ; preds = %lor.lhs.false985, %if.end981
  %379 = load i32, i32* %flags, align 4, !dbg !1290
  %conv990 = sext i32 %379 to i64, !dbg !1290
  %and991 = and i64 %conv990, 1024, !dbg !1293
  %tobool992 = icmp ne i64 %and991, 0, !dbg !1293
  br i1 %tobool992, label %land.lhs.true993, label %if.end1009, !dbg !1294

land.lhs.true993:                                 ; preds = %if.then989
  %380 = load i32, i32* %flags, align 4, !dbg !1295
  %conv994 = sext i32 %380 to i64, !dbg !1295
  %and995 = and i64 %conv994, 2048, !dbg !1296
  %tobool996 = icmp ne i64 %and995, 0, !dbg !1296
  br i1 %tobool996, label %if.end1009, label %if.then997, !dbg !1297

if.then997:                                       ; preds = %land.lhs.true993
  %381 = load i32, i32* %flags, align 4, !dbg !1298
  %conv998 = sext i32 %381 to i64, !dbg !1298
  %or999 = or i64 %conv998, 2048, !dbg !1298
  %conv1000 = trunc i64 %or999 to i32, !dbg !1298
  store i32 %conv1000, i32* %flags, align 4, !dbg !1298
  %382 = load i8, i8* %b, align 1, !dbg !1300
  %conv1001 = sext i8 %382 to i32, !dbg !1300
  %cmp1002 = icmp eq i32 %conv1001, 45, !dbg !1302
  br i1 %cmp1002, label %if.then1004, label %if.end1008, !dbg !1303

if.then1004:                                      ; preds = %if.then997
  %383 = load i32, i32* %flags, align 4, !dbg !1304
  %conv1005 = sext i32 %383 to i64, !dbg !1304
  %or1006 = or i64 %conv1005, 4096, !dbg !1304
  %conv1007 = trunc i64 %or1006 to i32, !dbg !1304
  store i32 %conv1007, i32* %flags, align 4, !dbg !1304
  br label %if.end1008, !dbg !1305

if.end1008:                                       ; preds = %if.then1004, %if.then997
  br label %for.inc, !dbg !1306

if.end1009:                                       ; preds = %land.lhs.true993, %if.then989
  br label %if.end1036, !dbg !1307

if.else1010:                                      ; preds = %lor.lhs.false985
  %384 = load i8, i8* %b, align 1, !dbg !1308
  %conv1011 = sext i8 %384 to i32, !dbg !1308
  %cmp1012 = icmp eq i32 %conv1011, 46, !dbg !1310
  br i1 %cmp1012, label %land.lhs.true1014, label %if.end1035, !dbg !1311

land.lhs.true1014:                                ; preds = %if.else1010
  %385 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1312
  %type1015 = getelementptr inbounds %struct._json_value, %struct._json_value* %385, i32 0, i32 1, !dbg !1313
  %386 = load i32, i32* %type1015, align 8, !dbg !1313
  %cmp1016 = icmp eq i32 %386, 3, !dbg !1314
  br i1 %cmp1016, label %if.then1018, label %if.end1035, !dbg !1315

if.then1018:                                      ; preds = %land.lhs.true1014
  %387 = load double, double* %num_digits, align 8, !dbg !1316
  %tobool1019 = fcmp une double %387, 0.000000e+00, !dbg !1316
  br i1 %tobool1019, label %if.end1025, label %if.then1020, !dbg !1319

if.then1020:                                      ; preds = %if.then1018
  %arraydecay1021 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !1320
  %cur_line1022 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !1322
  %388 = load i32, i32* %cur_line1022, align 8, !dbg !1322
  %cur_col1023 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !1322
  %389 = load i32, i32* %cur_col1023, align 4, !dbg !1322
  %call1024 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay1021, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.15, i32 0, i32 0), i32 %388, i32 %389) #8, !dbg !1323
  br label %e_failed, !dbg !1324

if.end1025:                                       ; preds = %if.then1018
  %390 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1325
  %type1026 = getelementptr inbounds %struct._json_value, %struct._json_value* %390, i32 0, i32 1, !dbg !1326
  store i32 4, i32* %type1026, align 8, !dbg !1327
  %391 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1328
  %u1027 = getelementptr inbounds %struct._json_value, %struct._json_value* %391, i32 0, i32 2, !dbg !1329
  %integer1028 = bitcast %union.anon* %u1027 to i64*, !dbg !1330
  %392 = load i64, i64* %integer1028, align 8, !dbg !1330
  %conv1029 = sitofp i64 %392 to double, !dbg !1331
  %393 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1332
  %u1030 = getelementptr inbounds %struct._json_value, %struct._json_value* %393, i32 0, i32 2, !dbg !1333
  %dbl1031 = bitcast %union.anon* %u1030 to double*, !dbg !1334
  store double %conv1029, double* %dbl1031, align 8, !dbg !1335
  %394 = load i32, i32* %flags, align 4, !dbg !1336
  %conv1032 = sext i32 %394 to i64, !dbg !1336
  %or1033 = or i64 %conv1032, 32768, !dbg !1336
  %conv1034 = trunc i64 %or1033 to i32, !dbg !1336
  store i32 %conv1034, i32* %flags, align 4, !dbg !1336
  store double 0.000000e+00, double* %num_digits, align 8, !dbg !1337
  br label %for.inc, !dbg !1338

if.end1035:                                       ; preds = %land.lhs.true1014, %if.else1010
  br label %if.end1036

if.end1036:                                       ; preds = %if.end1035, %if.end1009
  %395 = load i32, i32* %flags, align 4, !dbg !1339
  %conv1037 = sext i32 %395 to i64, !dbg !1339
  %and1038 = and i64 %conv1037, 1024, !dbg !1341
  %tobool1039 = icmp ne i64 %and1038, 0, !dbg !1341
  br i1 %tobool1039, label %if.else1084, label %if.then1040, !dbg !1342

if.then1040:                                      ; preds = %if.end1036
  %396 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1343
  %type1041 = getelementptr inbounds %struct._json_value, %struct._json_value* %396, i32 0, i32 1, !dbg !1346
  %397 = load i32, i32* %type1041, align 8, !dbg !1346
  %cmp1042 = icmp eq i32 %397, 4, !dbg !1347
  br i1 %cmp1042, label %if.then1044, label %if.end1057, !dbg !1348

if.then1044:                                      ; preds = %if.then1040
  %398 = load double, double* %num_digits, align 8, !dbg !1349
  %tobool1045 = fcmp une double %398, 0.000000e+00, !dbg !1349
  br i1 %tobool1045, label %if.end1051, label %if.then1046, !dbg !1352

if.then1046:                                      ; preds = %if.then1044
  %arraydecay1047 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !1353
  %cur_line1048 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !1355
  %399 = load i32, i32* %cur_line1048, align 8, !dbg !1355
  %cur_col1049 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !1355
  %400 = load i32, i32* %cur_col1049, align 4, !dbg !1355
  %call1050 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay1047, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.16, i32 0, i32 0), i32 %399, i32 %400) #8, !dbg !1356
  br label %e_failed, !dbg !1357

if.end1051:                                       ; preds = %if.then1044
  %401 = load double, double* %num_fraction, align 8, !dbg !1358
  %402 = load double, double* %num_digits, align 8, !dbg !1359
  %call1052 = call double @pow(double 1.000000e+01, double %402) #8, !dbg !1360
  %div1053 = fdiv double %401, %call1052, !dbg !1361
  %403 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1362
  %u1054 = getelementptr inbounds %struct._json_value, %struct._json_value* %403, i32 0, i32 2, !dbg !1363
  %dbl1055 = bitcast %union.anon* %u1054 to double*, !dbg !1364
  %404 = load double, double* %dbl1055, align 8, !dbg !1365
  %add1056 = fadd double %404, %div1053, !dbg !1365
  store double %add1056, double* %dbl1055, align 8, !dbg !1365
  br label %if.end1057, !dbg !1366

if.end1057:                                       ; preds = %if.end1051, %if.then1040
  %405 = load i8, i8* %b, align 1, !dbg !1367
  %conv1058 = sext i8 %405 to i32, !dbg !1367
  %cmp1059 = icmp eq i32 %conv1058, 101, !dbg !1369
  br i1 %cmp1059, label %if.then1065, label %lor.lhs.false1061, !dbg !1370

lor.lhs.false1061:                                ; preds = %if.end1057
  %406 = load i8, i8* %b, align 1, !dbg !1371
  %conv1062 = sext i8 %406 to i32, !dbg !1371
  %cmp1063 = icmp eq i32 %conv1062, 69, !dbg !1372
  br i1 %cmp1063, label %if.then1065, label %if.end1083, !dbg !1373

if.then1065:                                      ; preds = %lor.lhs.false1061, %if.end1057
  %407 = load i32, i32* %flags, align 4, !dbg !1374
  %conv1066 = sext i32 %407 to i64, !dbg !1374
  %or1067 = or i64 %conv1066, 1024, !dbg !1374
  %conv1068 = trunc i64 %or1067 to i32, !dbg !1374
  store i32 %conv1068, i32* %flags, align 4, !dbg !1374
  %408 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1376
  %type1069 = getelementptr inbounds %struct._json_value, %struct._json_value* %408, i32 0, i32 1, !dbg !1378
  %409 = load i32, i32* %type1069, align 8, !dbg !1378
  %cmp1070 = icmp eq i32 %409, 3, !dbg !1379
  br i1 %cmp1070, label %if.then1072, label %if.end1079, !dbg !1380

if.then1072:                                      ; preds = %if.then1065
  %410 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1381
  %type1073 = getelementptr inbounds %struct._json_value, %struct._json_value* %410, i32 0, i32 1, !dbg !1383
  store i32 4, i32* %type1073, align 8, !dbg !1384
  %411 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1385
  %u1074 = getelementptr inbounds %struct._json_value, %struct._json_value* %411, i32 0, i32 2, !dbg !1386
  %integer1075 = bitcast %union.anon* %u1074 to i64*, !dbg !1387
  %412 = load i64, i64* %integer1075, align 8, !dbg !1387
  %conv1076 = sitofp i64 %412 to double, !dbg !1388
  %413 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1389
  %u1077 = getelementptr inbounds %struct._json_value, %struct._json_value* %413, i32 0, i32 2, !dbg !1390
  %dbl1078 = bitcast %union.anon* %u1077 to double*, !dbg !1391
  store double %conv1076, double* %dbl1078, align 8, !dbg !1392
  br label %if.end1079, !dbg !1393

if.end1079:                                       ; preds = %if.then1072, %if.then1065
  store double 0.000000e+00, double* %num_digits, align 8, !dbg !1394
  %414 = load i32, i32* %flags, align 4, !dbg !1395
  %conv1080 = sext i32 %414 to i64, !dbg !1395
  %and1081 = and i64 %conv1080, -513, !dbg !1395
  %conv1082 = trunc i64 %and1081 to i32, !dbg !1395
  store i32 %conv1082, i32* %flags, align 4, !dbg !1395
  br label %for.inc, !dbg !1396

if.end1083:                                       ; preds = %lor.lhs.false1061
  br label %if.end1104, !dbg !1397

if.else1084:                                      ; preds = %if.end1036
  %415 = load double, double* %num_digits, align 8, !dbg !1398
  %tobool1085 = fcmp une double %415, 0.000000e+00, !dbg !1398
  br i1 %tobool1085, label %if.end1091, label %if.then1086, !dbg !1401

if.then1086:                                      ; preds = %if.else1084
  %arraydecay1087 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !1402
  %cur_line1088 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !1404
  %416 = load i32, i32* %cur_line1088, align 8, !dbg !1404
  %cur_col1089 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !1404
  %417 = load i32, i32* %cur_col1089, align 4, !dbg !1404
  %call1090 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay1087, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.17, i32 0, i32 0), i32 %416, i32 %417) #8, !dbg !1405
  br label %e_failed, !dbg !1406

if.end1091:                                       ; preds = %if.else1084
  %418 = load i32, i32* %flags, align 4, !dbg !1407
  %conv1092 = sext i32 %418 to i64, !dbg !1407
  %and1093 = and i64 %conv1092, 4096, !dbg !1408
  %tobool1094 = icmp ne i64 %and1093, 0, !dbg !1408
  br i1 %tobool1094, label %cond.true1095, label %cond.false1097, !dbg !1407

cond.true1095:                                    ; preds = %if.end1091
  %419 = load double, double* %num_e, align 8, !dbg !1409
  %sub1096 = fsub double -0.000000e+00, %419, !dbg !1410
  br label %cond.end1098, !dbg !1407

cond.false1097:                                   ; preds = %if.end1091
  %420 = load double, double* %num_e, align 8, !dbg !1411
  br label %cond.end1098, !dbg !1407

cond.end1098:                                     ; preds = %cond.false1097, %cond.true1095
  %cond1099 = phi double [ %sub1096, %cond.true1095 ], [ %420, %cond.false1097 ], !dbg !1407
  %call1100 = call double @pow(double 1.000000e+01, double %cond1099) #8, !dbg !1412
  %421 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1413
  %u1101 = getelementptr inbounds %struct._json_value, %struct._json_value* %421, i32 0, i32 2, !dbg !1414
  %dbl1102 = bitcast %union.anon* %u1101 to double*, !dbg !1415
  %422 = load double, double* %dbl1102, align 8, !dbg !1416
  %mul1103 = fmul double %422, %call1100, !dbg !1416
  store double %mul1103, double* %dbl1102, align 8, !dbg !1416
  br label %if.end1104

if.end1104:                                       ; preds = %cond.end1098, %if.end1083
  %423 = load i32, i32* %flags, align 4, !dbg !1417
  %conv1105 = sext i32 %423 to i64, !dbg !1417
  %and1106 = and i64 %conv1105, 256, !dbg !1419
  %tobool1107 = icmp ne i64 %and1106, 0, !dbg !1419
  br i1 %tobool1107, label %if.then1108, label %if.end1125, !dbg !1420

if.then1108:                                      ; preds = %if.end1104
  %424 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1421
  %type1109 = getelementptr inbounds %struct._json_value, %struct._json_value* %424, i32 0, i32 1, !dbg !1424
  %425 = load i32, i32* %type1109, align 8, !dbg !1424
  %cmp1110 = icmp eq i32 %425, 3, !dbg !1425
  br i1 %cmp1110, label %if.then1112, label %if.else1118, !dbg !1426

if.then1112:                                      ; preds = %if.then1108
  %426 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1427
  %u1113 = getelementptr inbounds %struct._json_value, %struct._json_value* %426, i32 0, i32 2, !dbg !1428
  %integer1114 = bitcast %union.anon* %u1113 to i64*, !dbg !1429
  %427 = load i64, i64* %integer1114, align 8, !dbg !1429
  %sub1115 = sub nsw i64 0, %427, !dbg !1430
  %428 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1431
  %u1116 = getelementptr inbounds %struct._json_value, %struct._json_value* %428, i32 0, i32 2, !dbg !1432
  %integer1117 = bitcast %union.anon* %u1116 to i64*, !dbg !1433
  store i64 %sub1115, i64* %integer1117, align 8, !dbg !1434
  br label %if.end1124, !dbg !1431

if.else1118:                                      ; preds = %if.then1108
  %429 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1435
  %u1119 = getelementptr inbounds %struct._json_value, %struct._json_value* %429, i32 0, i32 2, !dbg !1436
  %dbl1120 = bitcast %union.anon* %u1119 to double*, !dbg !1437
  %430 = load double, double* %dbl1120, align 8, !dbg !1437
  %sub1121 = fsub double -0.000000e+00, %430, !dbg !1438
  %431 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1439
  %u1122 = getelementptr inbounds %struct._json_value, %struct._json_value* %431, i32 0, i32 2, !dbg !1440
  %dbl1123 = bitcast %union.anon* %u1122 to double*, !dbg !1441
  store double %sub1121, double* %dbl1123, align 8, !dbg !1442
  br label %if.end1124

if.end1124:                                       ; preds = %if.else1118, %if.then1112
  br label %if.end1125, !dbg !1443

if.end1125:                                       ; preds = %if.end1124, %if.end1104
  %432 = load i32, i32* %flags, align 4, !dbg !1444
  %conv1126 = sext i32 %432 to i64, !dbg !1444
  %or1127 = or i64 %conv1126, 3, !dbg !1444
  %conv1128 = trunc i64 %or1127 to i32, !dbg !1444
  store i32 %conv1128, i32* %flags, align 4, !dbg !1444
  br label %sw.epilog1130, !dbg !1445

sw.default1129:                                   ; preds = %if.else847
  br label %sw.epilog1130, !dbg !1446

sw.epilog1130:                                    ; preds = %sw.default1129, %if.end1125, %sw.epilog900
  br label %if.end1131

if.end1131:                                       ; preds = %sw.epilog1130, %sw.epilog846
  %433 = load i32, i32* %flags, align 4, !dbg !1447
  %conv1132 = sext i32 %433 to i64, !dbg !1447
  %and1133 = and i64 %conv1132, 2, !dbg !1449
  %tobool1134 = icmp ne i64 %and1133, 0, !dbg !1449
  br i1 %tobool1134, label %if.then1135, label %if.end1141, !dbg !1450

if.then1135:                                      ; preds = %if.end1131
  %434 = load i32, i32* %flags, align 4, !dbg !1451
  %conv1136 = sext i32 %434 to i64, !dbg !1451
  %and1137 = and i64 %conv1136, -3, !dbg !1451
  %conv1138 = trunc i64 %and1137 to i32, !dbg !1451
  store i32 %conv1138, i32* %flags, align 4, !dbg !1451
  %ptr1139 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1453
  %435 = load i8*, i8** %ptr1139, align 8, !dbg !1454
  %incdec.ptr1140 = getelementptr inbounds i8, i8* %435, i32 -1, !dbg !1454
  store i8* %incdec.ptr1140, i8** %ptr1139, align 8, !dbg !1454
  br label %if.end1141, !dbg !1455

if.end1141:                                       ; preds = %if.then1135, %if.end1131
  %436 = load i32, i32* %flags, align 4, !dbg !1456
  %conv1142 = sext i32 %436 to i64, !dbg !1456
  %and1143 = and i64 %conv1142, 1, !dbg !1458
  %tobool1144 = icmp ne i64 %and1143, 0, !dbg !1458
  br i1 %tobool1144, label %if.then1145, label %if.end1203, !dbg !1459

if.then1145:                                      ; preds = %if.end1141
  %437 = load i32, i32* %flags, align 4, !dbg !1460
  %conv1146 = sext i32 %437 to i64, !dbg !1460
  %and1147 = and i64 %conv1146, -2, !dbg !1462
  %or1148 = or i64 %and1147, 4, !dbg !1463
  %conv1149 = trunc i64 %or1148 to i32, !dbg !1464
  store i32 %conv1149, i32* %flags, align 4, !dbg !1465
  %438 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1466
  %parent1150 = getelementptr inbounds %struct._json_value, %struct._json_value* %438, i32 0, i32 0, !dbg !1468
  %439 = load %struct._json_value*, %struct._json_value** %parent1150, align 8, !dbg !1468
  %tobool1151 = icmp ne %struct._json_value* %439, null, !dbg !1466
  br i1 %tobool1151, label %if.end1156, label %if.then1152, !dbg !1469

if.then1152:                                      ; preds = %if.then1145
  %440 = load i32, i32* %flags, align 4, !dbg !1470
  %conv1153 = sext i32 %440 to i64, !dbg !1470
  %or1154 = or i64 %conv1153, 128, !dbg !1470
  %conv1155 = trunc i64 %or1154 to i32, !dbg !1470
  store i32 %conv1155, i32* %flags, align 4, !dbg !1470
  br label %for.inc, !dbg !1472

if.end1156:                                       ; preds = %if.then1145
  %441 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1473
  %parent1157 = getelementptr inbounds %struct._json_value, %struct._json_value* %441, i32 0, i32 0, !dbg !1475
  %442 = load %struct._json_value*, %struct._json_value** %parent1157, align 8, !dbg !1475
  %type1158 = getelementptr inbounds %struct._json_value, %struct._json_value* %442, i32 0, i32 1, !dbg !1476
  %443 = load i32, i32* %type1158, align 8, !dbg !1476
  %cmp1159 = icmp eq i32 %443, 2, !dbg !1477
  br i1 %cmp1159, label %if.then1161, label %if.end1165, !dbg !1478

if.then1161:                                      ; preds = %if.end1156
  %444 = load i32, i32* %flags, align 4, !dbg !1479
  %conv1162 = sext i32 %444 to i64, !dbg !1479
  %or1163 = or i64 %conv1162, 8, !dbg !1479
  %conv1164 = trunc i64 %or1163 to i32, !dbg !1479
  store i32 %conv1164, i32* %flags, align 4, !dbg !1479
  br label %if.end1165, !dbg !1480

if.end1165:                                       ; preds = %if.then1161, %if.end1156
  %first_pass1166 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !1481
  %445 = load i32, i32* %first_pass1166, align 8, !dbg !1481
  %tobool1167 = icmp ne i32 %445, 0, !dbg !1483
  br i1 %tobool1167, label %if.end1191, label %if.then1168, !dbg !1484

if.then1168:                                      ; preds = %if.end1165
  call void @llvm.dbg.declare(metadata %struct._json_value** %parent1169, metadata !1485, metadata !DIExpression()), !dbg !1487
  %446 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1488
  %parent1170 = getelementptr inbounds %struct._json_value, %struct._json_value* %446, i32 0, i32 0, !dbg !1489
  %447 = load %struct._json_value*, %struct._json_value** %parent1170, align 8, !dbg !1489
  store %struct._json_value* %447, %struct._json_value** %parent1169, align 8, !dbg !1487
  %448 = load %struct._json_value*, %struct._json_value** %parent1169, align 8, !dbg !1490
  %type1171 = getelementptr inbounds %struct._json_value, %struct._json_value* %448, i32 0, i32 1, !dbg !1491
  %449 = load i32, i32* %type1171, align 8, !dbg !1491
  switch i32 %449, label %sw.default1189 [
    i32 1, label %sw.bb1172
    i32 2, label %sw.bb1181
  ], !dbg !1492

sw.bb1172:                                        ; preds = %if.then1168
  %450 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1493
  %451 = load %struct._json_value*, %struct._json_value** %parent1169, align 8, !dbg !1495
  %u1173 = getelementptr inbounds %struct._json_value, %struct._json_value* %451, i32 0, i32 2, !dbg !1496
  %object1174 = bitcast %union.anon* %u1173 to %struct.anon.0*, !dbg !1497
  %values1175 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object1174, i32 0, i32 1, !dbg !1498
  %452 = load %struct._json_object_entry*, %struct._json_object_entry** %values1175, align 8, !dbg !1498
  %453 = load %struct._json_value*, %struct._json_value** %parent1169, align 8, !dbg !1499
  %u1176 = getelementptr inbounds %struct._json_value, %struct._json_value* %453, i32 0, i32 2, !dbg !1500
  %object1177 = bitcast %union.anon* %u1176 to %struct.anon.0*, !dbg !1501
  %length1178 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object1177, i32 0, i32 0, !dbg !1502
  %454 = load i32, i32* %length1178, align 8, !dbg !1502
  %idxprom1179 = zext i32 %454 to i64, !dbg !1495
  %arrayidx1180 = getelementptr inbounds %struct._json_object_entry, %struct._json_object_entry* %452, i64 %idxprom1179, !dbg !1495
  %value = getelementptr inbounds %struct._json_object_entry, %struct._json_object_entry* %arrayidx1180, i32 0, i32 2, !dbg !1503
  store %struct._json_value* %450, %struct._json_value** %value, align 8, !dbg !1504
  br label %sw.epilog1190, !dbg !1505

sw.bb1181:                                        ; preds = %if.then1168
  %455 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1506
  %456 = load %struct._json_value*, %struct._json_value** %parent1169, align 8, !dbg !1507
  %u1182 = getelementptr inbounds %struct._json_value, %struct._json_value* %456, i32 0, i32 2, !dbg !1508
  %array = bitcast %union.anon* %u1182 to %struct.anon.1*, !dbg !1509
  %values1183 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array, i32 0, i32 1, !dbg !1510
  %457 = load %struct._json_value**, %struct._json_value*** %values1183, align 8, !dbg !1510
  %458 = load %struct._json_value*, %struct._json_value** %parent1169, align 8, !dbg !1511
  %u1184 = getelementptr inbounds %struct._json_value, %struct._json_value* %458, i32 0, i32 2, !dbg !1512
  %array1185 = bitcast %union.anon* %u1184 to %struct.anon.1*, !dbg !1513
  %length1186 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array1185, i32 0, i32 0, !dbg !1514
  %459 = load i32, i32* %length1186, align 8, !dbg !1514
  %idxprom1187 = zext i32 %459 to i64, !dbg !1507
  %arrayidx1188 = getelementptr inbounds %struct._json_value*, %struct._json_value** %457, i64 %idxprom1187, !dbg !1507
  store %struct._json_value* %455, %struct._json_value** %arrayidx1188, align 8, !dbg !1515
  br label %sw.epilog1190, !dbg !1516

sw.default1189:                                   ; preds = %if.then1168
  br label %sw.epilog1190, !dbg !1517

sw.epilog1190:                                    ; preds = %sw.default1189, %sw.bb1181, %sw.bb1172
  br label %if.end1191, !dbg !1518

if.end1191:                                       ; preds = %sw.epilog1190, %if.end1165
  %460 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1519
  %parent1192 = getelementptr inbounds %struct._json_value, %struct._json_value* %460, i32 0, i32 0, !dbg !1521
  %461 = load %struct._json_value*, %struct._json_value** %parent1192, align 8, !dbg !1521
  %u1193 = getelementptr inbounds %struct._json_value, %struct._json_value* %461, i32 0, i32 2, !dbg !1522
  %array1194 = bitcast %union.anon* %u1193 to %struct.anon.1*, !dbg !1523
  %length1195 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array1194, i32 0, i32 0, !dbg !1524
  %462 = load i32, i32* %length1195, align 8, !dbg !1525
  %inc1196 = add i32 %462, 1, !dbg !1525
  store i32 %inc1196, i32* %length1195, align 8, !dbg !1525
  %uint_max1197 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 1, !dbg !1526
  %463 = load i32, i32* %uint_max1197, align 8, !dbg !1526
  %cmp1198 = icmp ugt i32 %inc1196, %463, !dbg !1527
  br i1 %cmp1198, label %if.then1200, label %if.end1201, !dbg !1528

if.then1200:                                      ; preds = %if.end1191
  br label %e_overflow, !dbg !1529

if.end1201:                                       ; preds = %if.end1191
  %464 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1530
  %parent1202 = getelementptr inbounds %struct._json_value, %struct._json_value* %464, i32 0, i32 0, !dbg !1531
  %465 = load %struct._json_value*, %struct._json_value** %parent1202, align 8, !dbg !1531
  store %struct._json_value* %465, %struct._json_value** %top, align 8, !dbg !1532
  br label %for.inc, !dbg !1533

if.end1203:                                       ; preds = %if.end1141
  br label %for.inc, !dbg !1534

for.inc:                                          ; preds = %if.end1203, %if.end1201, %if.then1152, %if.end1079, %if.end1025, %if.end1008, %if.end980, %if.end952, %if.else944, %sw.bb855, %if.end835, %if.end652, %if.end644, %if.end639, %if.then620, %if.then602, %sw.bb556, %sw.bb539, %sw.bb514, %sw.bb510, %if.end478, %if.end445, %do.end414, %if.end399, %if.then346, %sw.epilog
  %ptr1204 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1535
  %466 = load i8*, i8** %ptr1204, align 8, !dbg !1536
  %incdec.ptr1205 = getelementptr inbounds i8, i8* %466, i32 1, !dbg !1536
  store i8* %incdec.ptr1205, i8** %ptr1204, align 8, !dbg !1536
  br label %for.cond34, !dbg !1537, !llvm.loop !1538

for.end:                                          ; preds = %if.then532
  %467 = load %struct._json_value*, %struct._json_value** %root, align 8, !dbg !1541
  store %struct._json_value* %467, %struct._json_value** %alloc, align 8, !dbg !1542
  br label %for.inc1206, !dbg !1543

for.inc1206:                                      ; preds = %for.end
  %first_pass1207 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !1544
  %468 = load i32, i32* %first_pass1207, align 8, !dbg !1545
  %dec = add nsw i32 %468, -1, !dbg !1545
  store i32 %dec, i32* %first_pass1207, align 8, !dbg !1545
  br label %for.cond, !dbg !1546, !llvm.loop !1547

for.end1208:                                      ; preds = %for.cond
  %469 = load %struct._json_value*, %struct._json_value** %root, align 8, !dbg !1549
  store %struct._json_value* %469, %struct._json_value** %retval, align 8, !dbg !1550
  br label %return, !dbg !1550

e_unknown_value:                                  ; preds = %if.then759, %if.then725, %if.then684
  %arraydecay1209 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !1551
  %cur_line1210 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !1552
  %470 = load i32, i32* %cur_line1210, align 8, !dbg !1552
  %cur_col1211 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !1552
  %471 = load i32, i32* %cur_col1211, align 4, !dbg !1552
  %call1212 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay1209, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.18, i32 0, i32 0), i32 %470, i32 %471) #8, !dbg !1553
  br label %e_failed, !dbg !1554

e_alloc_failure:                                  ; preds = %if.then783, %if.then763, %if.then729, %if.then688, %if.then651, %if.then643, %if.then638
  %arraydecay1213 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !1555
  %call1214 = call i8* @strcpy(i8* %arraydecay1213, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.19, i32 0, i32 0)) #8, !dbg !1556
  br label %e_failed, !dbg !1557

e_overflow:                                       ; preds = %if.then1200, %if.then58
  %arraydecay1215 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !1558
  %cur_line1216 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 6, !dbg !1559
  %472 = load i32, i32* %cur_line1216, align 8, !dbg !1559
  %cur_col1217 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 7, !dbg !1559
  %473 = load i32, i32* %cur_col1217, align 4, !dbg !1559
  %call1218 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay1215, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.20, i32 0, i32 0), i32 %472, i32 %473) #8, !dbg !1560
  br label %e_failed, !dbg !1561

e_failed:                                         ; preds = %e_overflow, %e_alloc_failure, %e_unknown_value, %if.then1086, %if.then1046, %if.then1020, %if.then926, %sw.default894, %if.then860, %if.else839, %if.else624, %if.else606, %if.else588, %sw.default540, %sw.default518, %if.then502, %if.then492, %if.then452, %if.then212, %if.then143, %if.then51
  %474 = load i8*, i8** %error_buf.addr, align 8, !dbg !1562
  %tobool1219 = icmp ne i8* %474, null, !dbg !1562
  br i1 %tobool1219, label %if.then1220, label %if.end1229, !dbg !1564

if.then1220:                                      ; preds = %e_failed
  %arraydecay1221 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !1565
  %475 = load i8, i8* %arraydecay1221, align 16, !dbg !1565
  %tobool1222 = icmp ne i8 %475, 0, !dbg !1565
  br i1 %tobool1222, label %if.then1223, label %if.else1226, !dbg !1568

if.then1223:                                      ; preds = %if.then1220
  %476 = load i8*, i8** %error_buf.addr, align 8, !dbg !1569
  %arraydecay1224 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i32 0, i32 0, !dbg !1570
  %call1225 = call i8* @strcpy(i8* %476, i8* %arraydecay1224) #8, !dbg !1571
  br label %if.end1228, !dbg !1571

if.else1226:                                      ; preds = %if.then1220
  %477 = load i8*, i8** %error_buf.addr, align 8, !dbg !1572
  %call1227 = call i8* @strcpy(i8* %477, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.21, i32 0, i32 0)) #8, !dbg !1573
  br label %if.end1228

if.end1228:                                       ; preds = %if.else1226, %if.then1223
  br label %if.end1229, !dbg !1574

if.end1229:                                       ; preds = %if.end1228, %e_failed
  %first_pass1230 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !1575
  %478 = load i32, i32* %first_pass1230, align 8, !dbg !1575
  %tobool1231 = icmp ne i32 %478, 0, !dbg !1577
  br i1 %tobool1231, label %if.then1232, label %if.end1233, !dbg !1578

if.then1232:                                      ; preds = %if.end1229
  %479 = load %struct._json_value*, %struct._json_value** %root, align 8, !dbg !1579
  store %struct._json_value* %479, %struct._json_value** %alloc, align 8, !dbg !1580
  br label %if.end1233, !dbg !1581

if.end1233:                                       ; preds = %if.then1232, %if.end1229
  br label %while.cond1234, !dbg !1582

while.cond1234:                                   ; preds = %while.body1236, %if.end1233
  %480 = load %struct._json_value*, %struct._json_value** %alloc, align 8, !dbg !1583
  %tobool1235 = icmp ne %struct._json_value* %480, null, !dbg !1582
  br i1 %tobool1235, label %while.body1236, label %while.end1241, !dbg !1582

while.body1236:                                   ; preds = %while.cond1234
  %481 = load %struct._json_value*, %struct._json_value** %alloc, align 8, !dbg !1584
  %_reserved1237 = getelementptr inbounds %struct._json_value, %struct._json_value* %481, i32 0, i32 3, !dbg !1586
  %next_alloc = bitcast %union.anon.2* %_reserved1237 to %struct._json_value**, !dbg !1587
  %482 = load %struct._json_value*, %struct._json_value** %next_alloc, align 8, !dbg !1587
  store %struct._json_value* %482, %struct._json_value** %top, align 8, !dbg !1588
  %settings1238 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !1589
  %mem_free1239 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings1238, i32 0, i32 3, !dbg !1590
  %483 = load void (i8*, i8*)*, void (i8*, i8*)** %mem_free1239, align 8, !dbg !1590
  %484 = load %struct._json_value*, %struct._json_value** %alloc, align 8, !dbg !1591
  %485 = bitcast %struct._json_value* %484 to i8*, !dbg !1591
  %settings1240 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !1592
  %user_data = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings1240, i32 0, i32 4, !dbg !1593
  %486 = load i8*, i8** %user_data, align 8, !dbg !1593
  call void %483(i8* %485, i8* %486), !dbg !1594
  %487 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1595
  store %struct._json_value* %487, %struct._json_value** %alloc, align 8, !dbg !1596
  br label %while.cond1234, !dbg !1582, !llvm.loop !1597

while.end1241:                                    ; preds = %while.cond1234
  %first_pass1242 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !1599
  %488 = load i32, i32* %first_pass1242, align 8, !dbg !1599
  %tobool1243 = icmp ne i32 %488, 0, !dbg !1601
  br i1 %tobool1243, label %if.end1246, label %if.then1244, !dbg !1602

if.then1244:                                      ; preds = %while.end1241
  %settings1245 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !1603
  %489 = load %struct._json_value*, %struct._json_value** %root, align 8, !dbg !1604
  call void @json_value_free_ex(%struct.json_settings* %settings1245, %struct._json_value* %489), !dbg !1605
  br label %if.end1246, !dbg !1605

if.end1246:                                       ; preds = %if.then1244, %while.end1241
  store %struct._json_value* null, %struct._json_value** %retval, align 8, !dbg !1606
  br label %return, !dbg !1606

return:                                           ; preds = %if.end1246, %for.end1208
  %490 = load %struct._json_value*, %struct._json_value** %retval, align 8, !dbg !1607
  ret %struct._json_value* %490, !dbg !1607
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @default_alloc(i64 %size, i32 %zero, i8* %user_data) #0 !dbg !1608 {
entry:
  %size.addr = alloca i64, align 8
  %zero.addr = alloca i32, align 4
  %user_data.addr = alloca i8*, align 8
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !1609, metadata !DIExpression()), !dbg !1610
  store i32 %zero, i32* %zero.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %zero.addr, metadata !1611, metadata !DIExpression()), !dbg !1612
  store i8* %user_data, i8** %user_data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %user_data.addr, metadata !1613, metadata !DIExpression()), !dbg !1614
  %0 = load i32, i32* %zero.addr, align 4, !dbg !1615
  %tobool = icmp ne i32 %0, 0, !dbg !1615
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !1615

cond.true:                                        ; preds = %entry
  %1 = load i64, i64* %size.addr, align 8, !dbg !1616
  %call = call noalias i8* @calloc(i64 1, i64 %1) #8, !dbg !1617
  br label %cond.end, !dbg !1615

cond.false:                                       ; preds = %entry
  %2 = load i64, i64* %size.addr, align 8, !dbg !1618
  %call1 = call noalias i8* @malloc(i64 %2) #8, !dbg !1619
  br label %cond.end, !dbg !1615

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call, %cond.true ], [ %call1, %cond.false ], !dbg !1615
  ret i8* %cond, !dbg !1620
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @default_free(i8* %ptr, i8* %user_data) #0 !dbg !1621 {
entry:
  %ptr.addr = alloca i8*, align 8
  %user_data.addr = alloca i8*, align 8
  store i8* %ptr, i8** %ptr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %ptr.addr, metadata !1622, metadata !DIExpression()), !dbg !1623
  store i8* %user_data, i8** %user_data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %user_data.addr, metadata !1624, metadata !DIExpression()), !dbg !1625
  %0 = load i8*, i8** %ptr.addr, align 8, !dbg !1626
  call void @free(i8* %0) #8, !dbg !1627
  ret void, !dbg !1628
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8*, i8*, ...) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i8 @hex_value(i8 signext %c) #0 !dbg !1629 {
entry:
  %retval = alloca i8, align 1
  %c.addr = alloca i8, align 1
  store i8 %c, i8* %c.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %c.addr, metadata !1632, metadata !DIExpression()), !dbg !1633
  %call = call i16** @__ctype_b_loc() #9, !dbg !1634
  %0 = load i16*, i16** %call, align 8, !dbg !1634
  %1 = load i8, i8* %c.addr, align 1, !dbg !1634
  %conv = sext i8 %1 to i32, !dbg !1634
  %idxprom = sext i32 %conv to i64, !dbg !1634
  %arrayidx = getelementptr inbounds i16, i16* %0, i64 %idxprom, !dbg !1634
  %2 = load i16, i16* %arrayidx, align 2, !dbg !1634
  %conv1 = zext i16 %2 to i32, !dbg !1634
  %and = and i32 %conv1, 2048, !dbg !1634
  %tobool = icmp ne i32 %and, 0, !dbg !1634
  br i1 %tobool, label %if.then, label %if.end, !dbg !1636

if.then:                                          ; preds = %entry
  %3 = load i8, i8* %c.addr, align 1, !dbg !1637
  %conv2 = sext i8 %3 to i32, !dbg !1637
  %sub = sub nsw i32 %conv2, 48, !dbg !1638
  %conv3 = trunc i32 %sub to i8, !dbg !1637
  store i8 %conv3, i8* %retval, align 1, !dbg !1639
  br label %return, !dbg !1639

if.end:                                           ; preds = %entry
  %4 = load i8, i8* %c.addr, align 1, !dbg !1640
  %conv4 = sext i8 %4 to i32, !dbg !1640
  switch i32 %conv4, label %sw.default [
    i32 97, label %sw.bb
    i32 65, label %sw.bb
    i32 98, label %sw.bb5
    i32 66, label %sw.bb5
    i32 99, label %sw.bb6
    i32 67, label %sw.bb6
    i32 100, label %sw.bb7
    i32 68, label %sw.bb7
    i32 101, label %sw.bb8
    i32 69, label %sw.bb8
    i32 102, label %sw.bb9
    i32 70, label %sw.bb9
  ], !dbg !1641

sw.bb:                                            ; preds = %if.end, %if.end
  store i8 10, i8* %retval, align 1, !dbg !1642
  br label %return, !dbg !1642

sw.bb5:                                           ; preds = %if.end, %if.end
  store i8 11, i8* %retval, align 1, !dbg !1644
  br label %return, !dbg !1644

sw.bb6:                                           ; preds = %if.end, %if.end
  store i8 12, i8* %retval, align 1, !dbg !1645
  br label %return, !dbg !1645

sw.bb7:                                           ; preds = %if.end, %if.end
  store i8 13, i8* %retval, align 1, !dbg !1646
  br label %return, !dbg !1646

sw.bb8:                                           ; preds = %if.end, %if.end
  store i8 14, i8* %retval, align 1, !dbg !1647
  br label %return, !dbg !1647

sw.bb9:                                           ; preds = %if.end, %if.end
  store i8 15, i8* %retval, align 1, !dbg !1648
  br label %return, !dbg !1648

sw.default:                                       ; preds = %if.end
  store i8 -1, i8* %retval, align 1, !dbg !1649
  br label %return, !dbg !1649

return:                                           ; preds = %sw.default, %sw.bb9, %sw.bb8, %sw.bb7, %sw.bb6, %sw.bb5, %sw.bb, %if.then
  %5 = load i8, i8* %retval, align 1, !dbg !1650
  ret i8 %5, !dbg !1650
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @new_value(%struct.json_state* %state, %struct._json_value** %top, %struct._json_value** %root, %struct._json_value** %alloc, i32 %type) #0 !dbg !1651 {
entry:
  %retval = alloca i32, align 4
  %state.addr = alloca %struct.json_state*, align 8
  %top.addr = alloca %struct._json_value**, align 8
  %root.addr = alloca %struct._json_value**, align 8
  %alloc.addr = alloca %struct._json_value**, align 8
  %type.addr = alloca i32, align 4
  %value = alloca %struct._json_value*, align 8
  %values_size = alloca i32, align 4
  store %struct.json_state* %state, %struct.json_state** %state.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.json_state** %state.addr, metadata !1655, metadata !DIExpression()), !dbg !1656
  store %struct._json_value** %top, %struct._json_value*** %top.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._json_value*** %top.addr, metadata !1657, metadata !DIExpression()), !dbg !1658
  store %struct._json_value** %root, %struct._json_value*** %root.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._json_value*** %root.addr, metadata !1659, metadata !DIExpression()), !dbg !1660
  store %struct._json_value** %alloc, %struct._json_value*** %alloc.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._json_value*** %alloc.addr, metadata !1661, metadata !DIExpression()), !dbg !1662
  store i32 %type, i32* %type.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %type.addr, metadata !1663, metadata !DIExpression()), !dbg !1664
  call void @llvm.dbg.declare(metadata %struct._json_value** %value, metadata !1665, metadata !DIExpression()), !dbg !1666
  call void @llvm.dbg.declare(metadata i32* %values_size, metadata !1667, metadata !DIExpression()), !dbg !1668
  %0 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !1669
  %first_pass = getelementptr inbounds %struct.json_state, %struct.json_state* %0, i32 0, i32 4, !dbg !1671
  %1 = load i32, i32* %first_pass, align 8, !dbg !1671
  %tobool = icmp ne i32 %1, 0, !dbg !1669
  br i1 %tobool, label %if.end63, label %if.then, !dbg !1672

if.then:                                          ; preds = %entry
  %2 = load %struct._json_value**, %struct._json_value*** %alloc.addr, align 8, !dbg !1673
  %3 = load %struct._json_value*, %struct._json_value** %2, align 8, !dbg !1675
  %4 = load %struct._json_value**, %struct._json_value*** %top.addr, align 8, !dbg !1676
  store %struct._json_value* %3, %struct._json_value** %4, align 8, !dbg !1677
  store %struct._json_value* %3, %struct._json_value** %value, align 8, !dbg !1678
  %5 = load %struct._json_value**, %struct._json_value*** %alloc.addr, align 8, !dbg !1679
  %6 = load %struct._json_value*, %struct._json_value** %5, align 8, !dbg !1680
  %_reserved = getelementptr inbounds %struct._json_value, %struct._json_value* %6, i32 0, i32 3, !dbg !1681
  %next_alloc = bitcast %union.anon.2* %_reserved to %struct._json_value**, !dbg !1682
  %7 = load %struct._json_value*, %struct._json_value** %next_alloc, align 8, !dbg !1682
  %8 = load %struct._json_value**, %struct._json_value*** %alloc.addr, align 8, !dbg !1683
  store %struct._json_value* %7, %struct._json_value** %8, align 8, !dbg !1684
  %9 = load %struct._json_value**, %struct._json_value*** %root.addr, align 8, !dbg !1685
  %10 = load %struct._json_value*, %struct._json_value** %9, align 8, !dbg !1687
  %tobool1 = icmp ne %struct._json_value* %10, null, !dbg !1687
  br i1 %tobool1, label %if.end, label %if.then2, !dbg !1688

if.then2:                                         ; preds = %if.then
  %11 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1689
  %12 = load %struct._json_value**, %struct._json_value*** %root.addr, align 8, !dbg !1690
  store %struct._json_value* %11, %struct._json_value** %12, align 8, !dbg !1691
  br label %if.end, !dbg !1692

if.end:                                           ; preds = %if.then2, %if.then
  %13 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1693
  %type3 = getelementptr inbounds %struct._json_value, %struct._json_value* %13, i32 0, i32 1, !dbg !1694
  %14 = load i32, i32* %type3, align 8, !dbg !1694
  switch i32 %14, label %sw.default [
    i32 2, label %sw.bb
    i32 1, label %sw.bb17
    i32 5, label %sw.bb48
  ], !dbg !1695

sw.bb:                                            ; preds = %if.end
  %15 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1696
  %u = getelementptr inbounds %struct._json_value, %struct._json_value* %15, i32 0, i32 2, !dbg !1699
  %array = bitcast %union.anon* %u to %struct.anon.1*, !dbg !1700
  %length = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array, i32 0, i32 0, !dbg !1701
  %16 = load i32, i32* %length, align 8, !dbg !1701
  %cmp = icmp eq i32 %16, 0, !dbg !1702
  br i1 %cmp, label %if.then4, label %if.end5, !dbg !1703

if.then4:                                         ; preds = %sw.bb
  br label %sw.epilog, !dbg !1704

if.end5:                                          ; preds = %sw.bb
  %17 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !1706
  %18 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1708
  %u6 = getelementptr inbounds %struct._json_value, %struct._json_value* %18, i32 0, i32 2, !dbg !1709
  %array7 = bitcast %union.anon* %u6 to %struct.anon.1*, !dbg !1710
  %length8 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array7, i32 0, i32 0, !dbg !1711
  %19 = load i32, i32* %length8, align 8, !dbg !1711
  %conv = zext i32 %19 to i64, !dbg !1708
  %mul = mul i64 %conv, 8, !dbg !1712
  %call = call i8* @json_alloc(%struct.json_state* %17, i64 %mul, i32 0), !dbg !1713
  %20 = bitcast i8* %call to %struct._json_value**, !dbg !1714
  %21 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1715
  %u9 = getelementptr inbounds %struct._json_value, %struct._json_value* %21, i32 0, i32 2, !dbg !1716
  %array10 = bitcast %union.anon* %u9 to %struct.anon.1*, !dbg !1717
  %values = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array10, i32 0, i32 1, !dbg !1718
  store %struct._json_value** %20, %struct._json_value*** %values, align 8, !dbg !1719
  %tobool11 = icmp ne %struct._json_value** %20, null, !dbg !1719
  br i1 %tobool11, label %if.end13, label %if.then12, !dbg !1720

if.then12:                                        ; preds = %if.end5
  store i32 0, i32* %retval, align 4, !dbg !1721
  br label %return, !dbg !1721

if.end13:                                         ; preds = %if.end5
  %22 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1723
  %u14 = getelementptr inbounds %struct._json_value, %struct._json_value* %22, i32 0, i32 2, !dbg !1724
  %array15 = bitcast %union.anon* %u14 to %struct.anon.1*, !dbg !1725
  %length16 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array15, i32 0, i32 0, !dbg !1726
  store i32 0, i32* %length16, align 8, !dbg !1727
  br label %sw.epilog, !dbg !1728

sw.bb17:                                          ; preds = %if.end
  %23 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1729
  %u18 = getelementptr inbounds %struct._json_value, %struct._json_value* %23, i32 0, i32 2, !dbg !1731
  %object = bitcast %union.anon* %u18 to %struct.anon.0*, !dbg !1732
  %length19 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object, i32 0, i32 0, !dbg !1733
  %24 = load i32, i32* %length19, align 8, !dbg !1733
  %cmp20 = icmp eq i32 %24, 0, !dbg !1734
  br i1 %cmp20, label %if.then22, label %if.end23, !dbg !1735

if.then22:                                        ; preds = %sw.bb17
  br label %sw.epilog, !dbg !1736

if.end23:                                         ; preds = %sw.bb17
  %25 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1737
  %u24 = getelementptr inbounds %struct._json_value, %struct._json_value* %25, i32 0, i32 2, !dbg !1738
  %object25 = bitcast %union.anon* %u24 to %struct.anon.0*, !dbg !1739
  %length26 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object25, i32 0, i32 0, !dbg !1740
  %26 = load i32, i32* %length26, align 8, !dbg !1740
  %conv27 = zext i32 %26 to i64, !dbg !1737
  %mul28 = mul i64 24, %conv27, !dbg !1741
  %conv29 = trunc i64 %mul28 to i32, !dbg !1742
  store i32 %conv29, i32* %values_size, align 4, !dbg !1743
  %27 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !1744
  %28 = load i32, i32* %values_size, align 4, !dbg !1746
  %conv30 = sext i32 %28 to i64, !dbg !1746
  %29 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1747
  %u31 = getelementptr inbounds %struct._json_value, %struct._json_value* %29, i32 0, i32 2, !dbg !1748
  %object32 = bitcast %union.anon* %u31 to %struct.anon.0*, !dbg !1749
  %values33 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object32, i32 0, i32 1, !dbg !1750
  %30 = load %struct._json_object_entry*, %struct._json_object_entry** %values33, align 8, !dbg !1750
  %31 = ptrtoint %struct._json_object_entry* %30 to i64, !dbg !1751
  %add = add i64 %conv30, %31, !dbg !1752
  %call34 = call i8* @json_alloc(%struct.json_state* %27, i64 %add, i32 0), !dbg !1753
  %32 = bitcast i8* %call34 to %struct._json_object_entry*, !dbg !1754
  %33 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1755
  %u35 = getelementptr inbounds %struct._json_value, %struct._json_value* %33, i32 0, i32 2, !dbg !1756
  %object36 = bitcast %union.anon* %u35 to %struct.anon.0*, !dbg !1757
  %values37 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object36, i32 0, i32 1, !dbg !1758
  store %struct._json_object_entry* %32, %struct._json_object_entry** %values37, align 8, !dbg !1759
  %tobool38 = icmp ne %struct._json_object_entry* %32, null, !dbg !1759
  br i1 %tobool38, label %if.end40, label %if.then39, !dbg !1760

if.then39:                                        ; preds = %if.end23
  store i32 0, i32* %retval, align 4, !dbg !1761
  br label %return, !dbg !1761

if.end40:                                         ; preds = %if.end23
  %34 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1763
  %u41 = getelementptr inbounds %struct._json_value, %struct._json_value* %34, i32 0, i32 2, !dbg !1764
  %object42 = bitcast %union.anon* %u41 to %struct.anon.0*, !dbg !1765
  %values43 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object42, i32 0, i32 1, !dbg !1766
  %35 = bitcast %struct._json_object_entry** %values43 to i8**, !dbg !1767
  %36 = load i8*, i8** %35, align 8, !dbg !1767
  %37 = load i32, i32* %values_size, align 4, !dbg !1768
  %idx.ext = sext i32 %37 to i64, !dbg !1769
  %add.ptr = getelementptr inbounds i8, i8* %36, i64 %idx.ext, !dbg !1769
  %38 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1770
  %_reserved44 = getelementptr inbounds %struct._json_value, %struct._json_value* %38, i32 0, i32 3, !dbg !1771
  %object_mem = bitcast %union.anon.2* %_reserved44 to i8**, !dbg !1772
  store i8* %add.ptr, i8** %object_mem, align 8, !dbg !1773
  %39 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1774
  %u45 = getelementptr inbounds %struct._json_value, %struct._json_value* %39, i32 0, i32 2, !dbg !1775
  %object46 = bitcast %union.anon* %u45 to %struct.anon.0*, !dbg !1776
  %length47 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object46, i32 0, i32 0, !dbg !1777
  store i32 0, i32* %length47, align 8, !dbg !1778
  br label %sw.epilog, !dbg !1779

sw.bb48:                                          ; preds = %if.end
  %40 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !1780
  %41 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1782
  %u49 = getelementptr inbounds %struct._json_value, %struct._json_value* %41, i32 0, i32 2, !dbg !1783
  %string = bitcast %union.anon* %u49 to %struct.anon*, !dbg !1784
  %length50 = getelementptr inbounds %struct.anon, %struct.anon* %string, i32 0, i32 0, !dbg !1785
  %42 = load i32, i32* %length50, align 8, !dbg !1785
  %add51 = add i32 %42, 1, !dbg !1786
  %conv52 = zext i32 %add51 to i64, !dbg !1787
  %mul53 = mul i64 %conv52, 1, !dbg !1788
  %call54 = call i8* @json_alloc(%struct.json_state* %40, i64 %mul53, i32 0), !dbg !1789
  %43 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1790
  %u55 = getelementptr inbounds %struct._json_value, %struct._json_value* %43, i32 0, i32 2, !dbg !1791
  %string56 = bitcast %union.anon* %u55 to %struct.anon*, !dbg !1792
  %ptr = getelementptr inbounds %struct.anon, %struct.anon* %string56, i32 0, i32 1, !dbg !1793
  store i8* %call54, i8** %ptr, align 8, !dbg !1794
  %tobool57 = icmp ne i8* %call54, null, !dbg !1794
  br i1 %tobool57, label %if.end59, label %if.then58, !dbg !1795

if.then58:                                        ; preds = %sw.bb48
  store i32 0, i32* %retval, align 4, !dbg !1796
  br label %return, !dbg !1796

if.end59:                                         ; preds = %sw.bb48
  %44 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1798
  %u60 = getelementptr inbounds %struct._json_value, %struct._json_value* %44, i32 0, i32 2, !dbg !1799
  %string61 = bitcast %union.anon* %u60 to %struct.anon*, !dbg !1800
  %length62 = getelementptr inbounds %struct.anon, %struct.anon* %string61, i32 0, i32 0, !dbg !1801
  store i32 0, i32* %length62, align 8, !dbg !1802
  br label %sw.epilog, !dbg !1803

sw.default:                                       ; preds = %if.end
  br label %sw.epilog, !dbg !1804

sw.epilog:                                        ; preds = %sw.default, %if.end59, %if.end40, %if.then22, %if.end13, %if.then4
  store i32 1, i32* %retval, align 4, !dbg !1805
  br label %return, !dbg !1805

if.end63:                                         ; preds = %entry
  %45 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !1806
  %46 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !1808
  %settings = getelementptr inbounds %struct.json_state, %struct.json_state* %46, i32 0, i32 3, !dbg !1809
  %value_extra = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings, i32 0, i32 5, !dbg !1810
  %47 = load i64, i64* %value_extra, align 8, !dbg !1810
  %add64 = add i64 40, %47, !dbg !1811
  %call65 = call i8* @json_alloc(%struct.json_state* %45, i64 %add64, i32 1), !dbg !1812
  %48 = bitcast i8* %call65 to %struct._json_value*, !dbg !1813
  store %struct._json_value* %48, %struct._json_value** %value, align 8, !dbg !1814
  %tobool66 = icmp ne %struct._json_value* %48, null, !dbg !1814
  br i1 %tobool66, label %if.end68, label %if.then67, !dbg !1815

if.then67:                                        ; preds = %if.end63
  store i32 0, i32* %retval, align 4, !dbg !1816
  br label %return, !dbg !1816

if.end68:                                         ; preds = %if.end63
  %49 = load %struct._json_value**, %struct._json_value*** %root.addr, align 8, !dbg !1818
  %50 = load %struct._json_value*, %struct._json_value** %49, align 8, !dbg !1820
  %tobool69 = icmp ne %struct._json_value* %50, null, !dbg !1820
  br i1 %tobool69, label %if.end71, label %if.then70, !dbg !1821

if.then70:                                        ; preds = %if.end68
  %51 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1822
  %52 = load %struct._json_value**, %struct._json_value*** %root.addr, align 8, !dbg !1823
  store %struct._json_value* %51, %struct._json_value** %52, align 8, !dbg !1824
  br label %if.end71, !dbg !1825

if.end71:                                         ; preds = %if.then70, %if.end68
  %53 = load i32, i32* %type.addr, align 4, !dbg !1826
  %54 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1827
  %type72 = getelementptr inbounds %struct._json_value, %struct._json_value* %54, i32 0, i32 1, !dbg !1828
  store i32 %53, i32* %type72, align 8, !dbg !1829
  %55 = load %struct._json_value**, %struct._json_value*** %top.addr, align 8, !dbg !1830
  %56 = load %struct._json_value*, %struct._json_value** %55, align 8, !dbg !1831
  %57 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1832
  %parent = getelementptr inbounds %struct._json_value, %struct._json_value* %57, i32 0, i32 0, !dbg !1833
  store %struct._json_value* %56, %struct._json_value** %parent, align 8, !dbg !1834
  %58 = load %struct._json_value**, %struct._json_value*** %alloc.addr, align 8, !dbg !1835
  %59 = load %struct._json_value*, %struct._json_value** %58, align 8, !dbg !1837
  %tobool73 = icmp ne %struct._json_value* %59, null, !dbg !1837
  br i1 %tobool73, label %if.then74, label %if.end77, !dbg !1838

if.then74:                                        ; preds = %if.end71
  %60 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1839
  %61 = load %struct._json_value**, %struct._json_value*** %alloc.addr, align 8, !dbg !1840
  %62 = load %struct._json_value*, %struct._json_value** %61, align 8, !dbg !1841
  %_reserved75 = getelementptr inbounds %struct._json_value, %struct._json_value* %62, i32 0, i32 3, !dbg !1842
  %next_alloc76 = bitcast %union.anon.2* %_reserved75 to %struct._json_value**, !dbg !1843
  store %struct._json_value* %60, %struct._json_value** %next_alloc76, align 8, !dbg !1844
  br label %if.end77, !dbg !1845

if.end77:                                         ; preds = %if.then74, %if.end71
  %63 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1846
  %64 = load %struct._json_value**, %struct._json_value*** %top.addr, align 8, !dbg !1847
  store %struct._json_value* %63, %struct._json_value** %64, align 8, !dbg !1848
  %65 = load %struct._json_value**, %struct._json_value*** %alloc.addr, align 8, !dbg !1849
  store %struct._json_value* %63, %struct._json_value** %65, align 8, !dbg !1850
  store i32 1, i32* %retval, align 4, !dbg !1851
  br label %return, !dbg !1851

return:                                           ; preds = %if.end77, %if.then67, %sw.epilog, %if.then58, %if.then39, %if.then12
  %66 = load i32, i32* %retval, align 4, !dbg !1852
  ret i32 %66, !dbg !1852
}

; Function Attrs: nounwind readnone
declare dso_local i16** @__ctype_b_loc() #5

; Function Attrs: nounwind
declare dso_local double @pow(double, double) #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @json_value_free_ex(%struct.json_settings* %settings, %struct._json_value* %value) #0 !dbg !1853 {
entry:
  %settings.addr = alloca %struct.json_settings*, align 8
  %value.addr = alloca %struct._json_value*, align 8
  %cur_value = alloca %struct._json_value*, align 8
  store %struct.json_settings* %settings, %struct.json_settings** %settings.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.json_settings** %settings.addr, metadata !1856, metadata !DIExpression()), !dbg !1857
  store %struct._json_value* %value, %struct._json_value** %value.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._json_value** %value.addr, metadata !1858, metadata !DIExpression()), !dbg !1859
  call void @llvm.dbg.declare(metadata %struct._json_value** %cur_value, metadata !1860, metadata !DIExpression()), !dbg !1861
  %0 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1862
  %tobool = icmp ne %struct._json_value* %0, null, !dbg !1862
  br i1 %tobool, label %if.end, label %if.then, !dbg !1864

if.then:                                          ; preds = %entry
  br label %while.end, !dbg !1865

if.end:                                           ; preds = %entry
  %1 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1866
  %parent = getelementptr inbounds %struct._json_value, %struct._json_value* %1, i32 0, i32 0, !dbg !1867
  store %struct._json_value* null, %struct._json_value** %parent, align 8, !dbg !1868
  br label %while.cond, !dbg !1869

while.cond:                                       ; preds = %sw.epilog, %if.end23, %if.end6, %if.end
  %2 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1870
  %tobool1 = icmp ne %struct._json_value* %2, null, !dbg !1869
  br i1 %tobool1, label %while.body, label %while.end, !dbg !1869

while.body:                                       ; preds = %while.cond
  %3 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1871
  %type = getelementptr inbounds %struct._json_value, %struct._json_value* %3, i32 0, i32 1, !dbg !1873
  %4 = load i32, i32* %type, align 8, !dbg !1873
  switch i32 %4, label %sw.default [
    i32 2, label %sw.bb
    i32 1, label %sw.bb13
    i32 5, label %sw.bb34
  ], !dbg !1874

sw.bb:                                            ; preds = %while.body
  %5 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1875
  %u = getelementptr inbounds %struct._json_value, %struct._json_value* %5, i32 0, i32 2, !dbg !1878
  %array = bitcast %union.anon* %u to %struct.anon.1*, !dbg !1879
  %length = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array, i32 0, i32 0, !dbg !1880
  %6 = load i32, i32* %length, align 8, !dbg !1880
  %tobool2 = icmp ne i32 %6, 0, !dbg !1875
  br i1 %tobool2, label %if.end6, label %if.then3, !dbg !1881

if.then3:                                         ; preds = %sw.bb
  %7 = load %struct.json_settings*, %struct.json_settings** %settings.addr, align 8, !dbg !1882
  %mem_free = getelementptr inbounds %struct.json_settings, %struct.json_settings* %7, i32 0, i32 3, !dbg !1884
  %8 = load void (i8*, i8*)*, void (i8*, i8*)** %mem_free, align 8, !dbg !1884
  %9 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1885
  %u4 = getelementptr inbounds %struct._json_value, %struct._json_value* %9, i32 0, i32 2, !dbg !1886
  %array5 = bitcast %union.anon* %u4 to %struct.anon.1*, !dbg !1887
  %values = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array5, i32 0, i32 1, !dbg !1888
  %10 = load %struct._json_value**, %struct._json_value*** %values, align 8, !dbg !1888
  %11 = bitcast %struct._json_value** %10 to i8*, !dbg !1885
  %12 = load %struct.json_settings*, %struct.json_settings** %settings.addr, align 8, !dbg !1889
  %user_data = getelementptr inbounds %struct.json_settings, %struct.json_settings* %12, i32 0, i32 4, !dbg !1890
  %13 = load i8*, i8** %user_data, align 8, !dbg !1890
  call void %8(i8* %11, i8* %13), !dbg !1882
  br label %sw.epilog, !dbg !1891

if.end6:                                          ; preds = %sw.bb
  %14 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1892
  %u7 = getelementptr inbounds %struct._json_value, %struct._json_value* %14, i32 0, i32 2, !dbg !1893
  %array8 = bitcast %union.anon* %u7 to %struct.anon.1*, !dbg !1894
  %values9 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array8, i32 0, i32 1, !dbg !1895
  %15 = load %struct._json_value**, %struct._json_value*** %values9, align 8, !dbg !1895
  %16 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1896
  %u10 = getelementptr inbounds %struct._json_value, %struct._json_value* %16, i32 0, i32 2, !dbg !1897
  %array11 = bitcast %union.anon* %u10 to %struct.anon.1*, !dbg !1898
  %length12 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array11, i32 0, i32 0, !dbg !1899
  %17 = load i32, i32* %length12, align 8, !dbg !1900
  %dec = add i32 %17, -1, !dbg !1900
  store i32 %dec, i32* %length12, align 8, !dbg !1900
  %idxprom = zext i32 %dec to i64, !dbg !1892
  %arrayidx = getelementptr inbounds %struct._json_value*, %struct._json_value** %15, i64 %idxprom, !dbg !1892
  %18 = load %struct._json_value*, %struct._json_value** %arrayidx, align 8, !dbg !1892
  store %struct._json_value* %18, %struct._json_value** %value.addr, align 8, !dbg !1901
  br label %while.cond, !dbg !1902, !llvm.loop !1903

sw.bb13:                                          ; preds = %while.body
  %19 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1905
  %u14 = getelementptr inbounds %struct._json_value, %struct._json_value* %19, i32 0, i32 2, !dbg !1907
  %object = bitcast %union.anon* %u14 to %struct.anon.0*, !dbg !1908
  %length15 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object, i32 0, i32 0, !dbg !1909
  %20 = load i32, i32* %length15, align 8, !dbg !1909
  %tobool16 = icmp ne i32 %20, 0, !dbg !1905
  br i1 %tobool16, label %if.end23, label %if.then17, !dbg !1910

if.then17:                                        ; preds = %sw.bb13
  %21 = load %struct.json_settings*, %struct.json_settings** %settings.addr, align 8, !dbg !1911
  %mem_free18 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %21, i32 0, i32 3, !dbg !1913
  %22 = load void (i8*, i8*)*, void (i8*, i8*)** %mem_free18, align 8, !dbg !1913
  %23 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1914
  %u19 = getelementptr inbounds %struct._json_value, %struct._json_value* %23, i32 0, i32 2, !dbg !1915
  %object20 = bitcast %union.anon* %u19 to %struct.anon.0*, !dbg !1916
  %values21 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object20, i32 0, i32 1, !dbg !1917
  %24 = load %struct._json_object_entry*, %struct._json_object_entry** %values21, align 8, !dbg !1917
  %25 = bitcast %struct._json_object_entry* %24 to i8*, !dbg !1914
  %26 = load %struct.json_settings*, %struct.json_settings** %settings.addr, align 8, !dbg !1918
  %user_data22 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %26, i32 0, i32 4, !dbg !1919
  %27 = load i8*, i8** %user_data22, align 8, !dbg !1919
  call void %22(i8* %25, i8* %27), !dbg !1911
  br label %sw.epilog, !dbg !1920

if.end23:                                         ; preds = %sw.bb13
  %28 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1921
  %u24 = getelementptr inbounds %struct._json_value, %struct._json_value* %28, i32 0, i32 2, !dbg !1922
  %object25 = bitcast %union.anon* %u24 to %struct.anon.0*, !dbg !1923
  %values26 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object25, i32 0, i32 1, !dbg !1924
  %29 = load %struct._json_object_entry*, %struct._json_object_entry** %values26, align 8, !dbg !1924
  %30 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1925
  %u27 = getelementptr inbounds %struct._json_value, %struct._json_value* %30, i32 0, i32 2, !dbg !1926
  %object28 = bitcast %union.anon* %u27 to %struct.anon.0*, !dbg !1927
  %length29 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object28, i32 0, i32 0, !dbg !1928
  %31 = load i32, i32* %length29, align 8, !dbg !1929
  %dec30 = add i32 %31, -1, !dbg !1929
  store i32 %dec30, i32* %length29, align 8, !dbg !1929
  %idxprom31 = zext i32 %dec30 to i64, !dbg !1921
  %arrayidx32 = getelementptr inbounds %struct._json_object_entry, %struct._json_object_entry* %29, i64 %idxprom31, !dbg !1921
  %value33 = getelementptr inbounds %struct._json_object_entry, %struct._json_object_entry* %arrayidx32, i32 0, i32 2, !dbg !1930
  %32 = load %struct._json_value*, %struct._json_value** %value33, align 8, !dbg !1930
  store %struct._json_value* %32, %struct._json_value** %value.addr, align 8, !dbg !1931
  br label %while.cond, !dbg !1932, !llvm.loop !1903

sw.bb34:                                          ; preds = %while.body
  %33 = load %struct.json_settings*, %struct.json_settings** %settings.addr, align 8, !dbg !1933
  %mem_free35 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %33, i32 0, i32 3, !dbg !1934
  %34 = load void (i8*, i8*)*, void (i8*, i8*)** %mem_free35, align 8, !dbg !1934
  %35 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1935
  %u36 = getelementptr inbounds %struct._json_value, %struct._json_value* %35, i32 0, i32 2, !dbg !1936
  %string = bitcast %union.anon* %u36 to %struct.anon*, !dbg !1937
  %ptr = getelementptr inbounds %struct.anon, %struct.anon* %string, i32 0, i32 1, !dbg !1938
  %36 = load i8*, i8** %ptr, align 8, !dbg !1938
  %37 = load %struct.json_settings*, %struct.json_settings** %settings.addr, align 8, !dbg !1939
  %user_data37 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %37, i32 0, i32 4, !dbg !1940
  %38 = load i8*, i8** %user_data37, align 8, !dbg !1940
  call void %34(i8* %36, i8* %38), !dbg !1933
  br label %sw.epilog, !dbg !1941

sw.default:                                       ; preds = %while.body
  br label %sw.epilog, !dbg !1942

sw.epilog:                                        ; preds = %sw.default, %sw.bb34, %if.then17, %if.then3
  %39 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1943
  store %struct._json_value* %39, %struct._json_value** %cur_value, align 8, !dbg !1944
  %40 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1945
  %parent38 = getelementptr inbounds %struct._json_value, %struct._json_value* %40, i32 0, i32 0, !dbg !1946
  %41 = load %struct._json_value*, %struct._json_value** %parent38, align 8, !dbg !1946
  store %struct._json_value* %41, %struct._json_value** %value.addr, align 8, !dbg !1947
  %42 = load %struct.json_settings*, %struct.json_settings** %settings.addr, align 8, !dbg !1948
  %mem_free39 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %42, i32 0, i32 3, !dbg !1949
  %43 = load void (i8*, i8*)*, void (i8*, i8*)** %mem_free39, align 8, !dbg !1949
  %44 = load %struct._json_value*, %struct._json_value** %cur_value, align 8, !dbg !1950
  %45 = bitcast %struct._json_value* %44 to i8*, !dbg !1950
  %46 = load %struct.json_settings*, %struct.json_settings** %settings.addr, align 8, !dbg !1951
  %user_data40 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %46, i32 0, i32 4, !dbg !1952
  %47 = load i8*, i8** %user_data40, align 8, !dbg !1952
  call void %43(i8* %45, i8* %47), !dbg !1948
  br label %while.cond, !dbg !1869, !llvm.loop !1903

while.end:                                        ; preds = %if.then, %while.cond
  ret void, !dbg !1953
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct._json_value* @json_parse(i8* %json, i64 %length) #0 !dbg !1954 {
entry:
  %json.addr = alloca i8*, align 8
  %length.addr = alloca i64, align 8
  %settings = alloca %struct.json_settings, align 8
  store i8* %json, i8** %json.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %json.addr, metadata !1957, metadata !DIExpression()), !dbg !1958
  store i64 %length, i64* %length.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %length.addr, metadata !1959, metadata !DIExpression()), !dbg !1960
  call void @llvm.dbg.declare(metadata %struct.json_settings* %settings, metadata !1961, metadata !DIExpression()), !dbg !1962
  %0 = bitcast %struct.json_settings* %settings to i8*, !dbg !1962
  call void @llvm.memset.p0i8.i64(i8* align 8 %0, i8 0, i64 48, i1 false), !dbg !1962
  %1 = load i8*, i8** %json.addr, align 8, !dbg !1963
  %2 = load i64, i64* %length.addr, align 8, !dbg !1964
  %call = call %struct._json_value* @json_parse_ex(%struct.json_settings* %settings, i8* %1, i64 %2, i8* null), !dbg !1965
  ret %struct._json_value* %call, !dbg !1966
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @json_value_free(%struct._json_value* %value) #0 !dbg !1967 {
entry:
  %value.addr = alloca %struct._json_value*, align 8
  %settings = alloca %struct.json_settings, align 8
  store %struct._json_value* %value, %struct._json_value** %value.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._json_value** %value.addr, metadata !1970, metadata !DIExpression()), !dbg !1971
  call void @llvm.dbg.declare(metadata %struct.json_settings* %settings, metadata !1972, metadata !DIExpression()), !dbg !1973
  %0 = bitcast %struct.json_settings* %settings to i8*, !dbg !1973
  call void @llvm.memset.p0i8.i64(i8* align 8 %0, i8 0, i64 48, i1 false), !dbg !1973
  %mem_free = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings, i32 0, i32 3, !dbg !1974
  store void (i8*, i8*)* @default_free, void (i8*, i8*)** %mem_free, align 8, !dbg !1975
  %1 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1976
  call void @json_value_free_ex(%struct.json_settings* %settings, %struct._json_value* %1), !dbg !1977
  ret void, !dbg !1978
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !1979 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %file_size = alloca i32, align 4
  %json = alloca i8*, align 8
  %value = alloca %struct._json_value*, align 8
  %file_contents = alloca [65536 x i8], align 16
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !1982, metadata !DIExpression()), !dbg !1983
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !1984, metadata !DIExpression()), !dbg !1985
  call void @llvm.dbg.declare(metadata i32* %file_size, metadata !1986, metadata !DIExpression()), !dbg !1987
  call void @llvm.dbg.declare(metadata i8** %json, metadata !1988, metadata !DIExpression()), !dbg !1989
  call void @llvm.dbg.declare(metadata %struct._json_value** %value, metadata !1990, metadata !DIExpression()), !dbg !1991
  call void @llvm.dbg.declare(metadata [65536 x i8]* %file_contents, metadata !1992, metadata !DIExpression()), !dbg !1996
  %arraydecay = getelementptr inbounds [65536 x i8], [65536 x i8]* %file_contents, i32 0, i32 0, !dbg !1997
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !1998
  %call = call i8* @fgets(i8* %arraydecay, i32 65536, %struct._IO_FILE* %0), !dbg !1999
  %arraydecay1 = getelementptr inbounds [65536 x i8], [65536 x i8]* %file_contents, i32 0, i32 0, !dbg !2000
  %call2 = call i64 @strlen(i8* %arraydecay1) #10, !dbg !2001
  %conv = trunc i64 %call2 to i32, !dbg !2001
  store i32 %conv, i32* %file_size, align 4, !dbg !2002
  %arraydecay3 = getelementptr inbounds [65536 x i8], [65536 x i8]* %file_contents, i32 0, i32 0, !dbg !2003
  store i8* %arraydecay3, i8** %json, align 8, !dbg !2004
  %1 = load i8*, i8** %json, align 8, !dbg !2005
  %2 = load i32, i32* %file_size, align 4, !dbg !2006
  %conv4 = sext i32 %2 to i64, !dbg !2006
  %call5 = call %struct._json_value* @json_parse(i8* %1, i64 %conv4), !dbg !2007
  store %struct._json_value* %call5, %struct._json_value** %value, align 8, !dbg !2008
  %3 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !2009
  %cmp = icmp eq %struct._json_value* %3, null, !dbg !2011
  br i1 %cmp, label %if.then, label %if.end, !dbg !2012

if.then:                                          ; preds = %entry
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2013
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.22, i32 0, i32 0)), !dbg !2015
  call void @exit(i32 0) #11, !dbg !2016
  unreachable, !dbg !2016

if.end:                                           ; preds = %entry
  %5 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !2017
  call void @json_value_free(%struct._json_value* %5), !dbg !2018
  ret i32 0, !dbg !2019
}

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #6

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #7

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #4

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @json_alloc(%struct.json_state* %state, i64 %size, i32 %zero) #0 !dbg !2020 {
entry:
  %retval = alloca i8*, align 8
  %state.addr = alloca %struct.json_state*, align 8
  %size.addr = alloca i64, align 8
  %zero.addr = alloca i32, align 4
  store %struct.json_state* %state, %struct.json_state** %state.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.json_state** %state.addr, metadata !2023, metadata !DIExpression()), !dbg !2024
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !2025, metadata !DIExpression()), !dbg !2026
  store i32 %zero, i32* %zero.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %zero.addr, metadata !2027, metadata !DIExpression()), !dbg !2028
  %0 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !2029
  %ulong_max = getelementptr inbounds %struct.json_state, %struct.json_state* %0, i32 0, i32 2, !dbg !2031
  %1 = load i64, i64* %ulong_max, align 8, !dbg !2031
  %2 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !2032
  %used_memory = getelementptr inbounds %struct.json_state, %struct.json_state* %2, i32 0, i32 0, !dbg !2033
  %3 = load i64, i64* %used_memory, align 8, !dbg !2033
  %sub = sub i64 %1, %3, !dbg !2034
  %4 = load i64, i64* %size.addr, align 8, !dbg !2035
  %cmp = icmp ult i64 %sub, %4, !dbg !2036
  br i1 %cmp, label %if.then, label %if.end, !dbg !2037

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 8, !dbg !2038
  br label %return, !dbg !2038

if.end:                                           ; preds = %entry
  %5 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !2039
  %settings = getelementptr inbounds %struct.json_state, %struct.json_state* %5, i32 0, i32 3, !dbg !2041
  %max_memory = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings, i32 0, i32 0, !dbg !2042
  %6 = load i64, i64* %max_memory, align 8, !dbg !2042
  %tobool = icmp ne i64 %6, 0, !dbg !2039
  br i1 %tobool, label %land.lhs.true, label %if.end6, !dbg !2043

land.lhs.true:                                    ; preds = %if.end
  %7 = load i64, i64* %size.addr, align 8, !dbg !2044
  %8 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !2045
  %used_memory1 = getelementptr inbounds %struct.json_state, %struct.json_state* %8, i32 0, i32 0, !dbg !2046
  %9 = load i64, i64* %used_memory1, align 8, !dbg !2047
  %add = add i64 %9, %7, !dbg !2047
  store i64 %add, i64* %used_memory1, align 8, !dbg !2047
  %10 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !2048
  %settings2 = getelementptr inbounds %struct.json_state, %struct.json_state* %10, i32 0, i32 3, !dbg !2049
  %max_memory3 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings2, i32 0, i32 0, !dbg !2050
  %11 = load i64, i64* %max_memory3, align 8, !dbg !2050
  %cmp4 = icmp ugt i64 %add, %11, !dbg !2051
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !2052

if.then5:                                         ; preds = %land.lhs.true
  store i8* null, i8** %retval, align 8, !dbg !2053
  br label %return, !dbg !2053

if.end6:                                          ; preds = %land.lhs.true, %if.end
  %12 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !2055
  %settings7 = getelementptr inbounds %struct.json_state, %struct.json_state* %12, i32 0, i32 3, !dbg !2056
  %mem_alloc = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings7, i32 0, i32 2, !dbg !2057
  %13 = load i8* (i64, i32, i8*)*, i8* (i64, i32, i8*)** %mem_alloc, align 8, !dbg !2057
  %14 = load i64, i64* %size.addr, align 8, !dbg !2058
  %15 = load i32, i32* %zero.addr, align 4, !dbg !2059
  %16 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !2060
  %settings8 = getelementptr inbounds %struct.json_state, %struct.json_state* %16, i32 0, i32 3, !dbg !2061
  %user_data = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings8, i32 0, i32 4, !dbg !2062
  %17 = load i8*, i8** %user_data, align 8, !dbg !2062
  %call = call i8* %13(i64 %14, i32 %15, i8* %17), !dbg !2055
  store i8* %call, i8** %retval, align 8, !dbg !2063
  br label %return, !dbg !2063

return:                                           ; preds = %if.end6, %if.then5, %if.then
  %18 = load i8*, i8** %retval, align 8, !dbg !2064
  ret i8* %18, !dbg !2064
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { argmemonly nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { nounwind readnone }
attributes #10 = { nounwind readonly }
attributes #11 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!124, !125, !126}
!llvm.ident = !{!127}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "json_value_none", scope: !2, file: !3, line: 8, type: !123, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 8.0.1- (branches/release_80)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !31, globals: !89, nameTableKind: None)
!3 = !DIFile(filename: "test6.c", directory: "/lab4/test")
!4 = !{!5, !16}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !3, line: 47, baseType: !6, size: 32, elements: !7)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!8, !9, !10, !11, !12, !13, !14, !15}
!8 = !DIEnumerator(name: "json_none", value: 0, isUnsigned: true)
!9 = !DIEnumerator(name: "json_object", value: 1, isUnsigned: true)
!10 = !DIEnumerator(name: "json_array", value: 2, isUnsigned: true)
!11 = !DIEnumerator(name: "json_integer", value: 3, isUnsigned: true)
!12 = !DIEnumerator(name: "json_double", value: 4, isUnsigned: true)
!13 = !DIEnumerator(name: "json_string", value: 5, isUnsigned: true)
!14 = !DIEnumerator(name: "json_boolean", value: 6, isUnsigned: true)
!15 = !DIEnumerator(name: "json_null", value: 7, isUnsigned: true)
!16 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !17, line: 46, baseType: !6, size: 32, elements: !18)
!17 = !DIFile(filename: "/usr/include/ctype.h", directory: "")
!18 = !{!19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30}
!19 = !DIEnumerator(name: "_ISupper", value: 256, isUnsigned: true)
!20 = !DIEnumerator(name: "_ISlower", value: 512, isUnsigned: true)
!21 = !DIEnumerator(name: "_ISalpha", value: 1024, isUnsigned: true)
!22 = !DIEnumerator(name: "_ISdigit", value: 2048, isUnsigned: true)
!23 = !DIEnumerator(name: "_ISxdigit", value: 4096, isUnsigned: true)
!24 = !DIEnumerator(name: "_ISspace", value: 8192, isUnsigned: true)
!25 = !DIEnumerator(name: "_ISprint", value: 16384, isUnsigned: true)
!26 = !DIEnumerator(name: "_ISgraph", value: 32768, isUnsigned: true)
!27 = !DIEnumerator(name: "_ISblank", value: 1, isUnsigned: true)
!28 = !DIEnumerator(name: "_IScntrl", value: 2, isUnsigned: true)
!29 = !DIEnumerator(name: "_ISpunct", value: 4, isUnsigned: true)
!30 = !DIEnumerator(name: "_ISalnum", value: 8, isUnsigned: true)
!31 = !{!32, !33, !34, !35, !36, !37, !38, !39, !40, !70, !88, !41}
!32 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!33 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!36 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!37 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!38 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "json_value", file: !3, line: 221, baseType: !43)
!43 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_json_value", file: !3, line: 71, size: 320, elements: !44)
!44 = !{!45, !47, !49, !83}
!45 = !DIDerivedType(tag: DW_TAG_member, name: "parent", scope: !43, file: !3, line: 73, baseType: !46, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !43, file: !3, line: 75, baseType: !48, size: 32, offset: 64)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "json_type", file: !3, line: 58, baseType: !5)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !43, file: !3, line: 123, baseType: !50, size: 128, offset: 128)
!50 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !43, file: !3, line: 77, size: 128, elements: !51)
!51 = !{!52, !53, !59, !60, !65, !77}
!52 = !DIDerivedType(tag: DW_TAG_member, name: "boolean", scope: !50, file: !3, line: 79, baseType: !36, size: 32)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "integer", scope: !50, file: !3, line: 80, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !55, line: 27, baseType: !56)
!55 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !57, line: 43, baseType: !58)
!57 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!58 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "dbl", scope: !50, file: !3, line: 81, baseType: !38, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "string", scope: !50, file: !3, line: 88, baseType: !61, size: 128)
!61 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !50, file: !3, line: 83, size: 128, elements: !62)
!62 = !{!63, !64}
!63 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !61, file: !3, line: 85, baseType: !6, size: 32)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "ptr", scope: !61, file: !3, line: 86, baseType: !35, size: 64, offset: 64)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "object", scope: !50, file: !3, line: 105, baseType: !66, size: 128)
!66 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !50, file: !3, line: 90, size: 128, elements: !67)
!67 = !{!68, !69}
!68 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !66, file: !3, line: 92, baseType: !6, size: 32)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "values", scope: !66, file: !3, line: 94, baseType: !70, size: 64, offset: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "json_object_entry", file: !3, line: 69, baseType: !72)
!72 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_json_object_entry", file: !3, line: 62, size: 192, elements: !73)
!73 = !{!74, !75, !76}
!74 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !72, file: !3, line: 64, baseType: !35, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "name_length", scope: !72, file: !3, line: 65, baseType: !6, size: 32, offset: 64)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !72, file: !3, line: 67, baseType: !46, size: 64, offset: 128)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "array", scope: !50, file: !3, line: 121, baseType: !78, size: 128)
!78 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !50, file: !3, line: 107, size: 128, elements: !79)
!79 = !{!80, !81}
!80 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !78, file: !3, line: 109, baseType: !6, size: 32)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "values", scope: !78, file: !3, line: 110, baseType: !82, size: 64, offset: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "_reserved", scope: !43, file: !3, line: 130, baseType: !84, size: 64, offset: 256)
!84 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !43, file: !3, line: 125, size: 64, elements: !85)
!85 = !{!86, !87}
!86 = !DIDerivedType(tag: DW_TAG_member, name: "next_alloc", scope: !84, file: !3, line: 127, baseType: !46, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "object_mem", scope: !84, file: !3, line: 128, baseType: !39, size: 64)
!88 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!89 = !{!90, !93, !95, !97, !99, !101, !103, !105, !107, !109, !111, !113, !115, !117, !119, !121, !0}
!90 = !DIGlobalVariableExpression(var: !91, expr: !DIExpression(DW_OP_constu, 8, DW_OP_stack_value))
!91 = distinct !DIGlobalVariable(name: "flag_seek_value", scope: !2, file: !3, line: 422, type: !92, isLocal: true, isDefinition: true)
!92 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !58)
!93 = !DIGlobalVariableExpression(var: !94, expr: !DIExpression(DW_OP_constu, 32, DW_OP_stack_value))
!94 = distinct !DIGlobalVariable(name: "flag_string", scope: !2, file: !3, line: 424, type: !92, isLocal: true, isDefinition: true)
!95 = !DIGlobalVariableExpression(var: !96, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!96 = distinct !DIGlobalVariable(name: "flag_escaped", scope: !2, file: !3, line: 423, type: !92, isLocal: true, isDefinition: true)
!97 = !DIGlobalVariableExpression(var: !98, expr: !DIExpression(DW_OP_constu, 1, DW_OP_stack_value))
!98 = distinct !DIGlobalVariable(name: "flag_next", scope: !2, file: !3, line: 419, type: !92, isLocal: true, isDefinition: true)
!99 = !DIGlobalVariableExpression(var: !100, expr: !DIExpression(DW_OP_constu, 64, DW_OP_stack_value))
!100 = distinct !DIGlobalVariable(name: "flag_need_colon", scope: !2, file: !3, line: 425, type: !92, isLocal: true, isDefinition: true)
!101 = !DIGlobalVariableExpression(var: !102, expr: !DIExpression(DW_OP_constu, 8192, DW_OP_stack_value))
!102 = distinct !DIGlobalVariable(name: "flag_line_comment", scope: !2, file: !3, line: 432, type: !92, isLocal: true, isDefinition: true)
!103 = !DIGlobalVariableExpression(var: !104, expr: !DIExpression(DW_OP_constu, 16384, DW_OP_stack_value))
!104 = distinct !DIGlobalVariable(name: "flag_block_comment", scope: !2, file: !3, line: 433, type: !92, isLocal: true, isDefinition: true)
!105 = !DIGlobalVariableExpression(var: !106, expr: !DIExpression(DW_OP_constu, 128, DW_OP_stack_value))
!106 = distinct !DIGlobalVariable(name: "flag_done", scope: !2, file: !3, line: 426, type: !92, isLocal: true, isDefinition: true)
!107 = !DIGlobalVariableExpression(var: !108, expr: !DIExpression(DW_OP_constu, 4, DW_OP_stack_value))
!108 = distinct !DIGlobalVariable(name: "flag_need_comma", scope: !2, file: !3, line: 421, type: !92, isLocal: true, isDefinition: true)
!109 = !DIGlobalVariableExpression(var: !110, expr: !DIExpression(DW_OP_constu, 2, DW_OP_stack_value))
!110 = distinct !DIGlobalVariable(name: "flag_reproc", scope: !2, file: !3, line: 420, type: !92, isLocal: true, isDefinition: true)
!111 = !DIGlobalVariableExpression(var: !112, expr: !DIExpression(DW_OP_constu, 256, DW_OP_stack_value))
!112 = distinct !DIGlobalVariable(name: "flag_num_negative", scope: !2, file: !3, line: 427, type: !92, isLocal: true, isDefinition: true)
!113 = !DIGlobalVariableExpression(var: !114, expr: !DIExpression(DW_OP_constu, 1024, DW_OP_stack_value))
!114 = distinct !DIGlobalVariable(name: "flag_num_e", scope: !2, file: !3, line: 429, type: !92, isLocal: true, isDefinition: true)
!115 = !DIGlobalVariableExpression(var: !116, expr: !DIExpression(DW_OP_constu, 2048, DW_OP_stack_value))
!116 = distinct !DIGlobalVariable(name: "flag_num_e_got_sign", scope: !2, file: !3, line: 430, type: !92, isLocal: true, isDefinition: true)
!117 = !DIGlobalVariableExpression(var: !118, expr: !DIExpression(DW_OP_constu, 4096, DW_OP_stack_value))
!118 = distinct !DIGlobalVariable(name: "flag_num_e_negative", scope: !2, file: !3, line: 431, type: !92, isLocal: true, isDefinition: true)
!119 = !DIGlobalVariableExpression(var: !120, expr: !DIExpression(DW_OP_constu, 512, DW_OP_stack_value))
!120 = distinct !DIGlobalVariable(name: "flag_num_zero", scope: !2, file: !3, line: 428, type: !92, isLocal: true, isDefinition: true)
!121 = !DIGlobalVariableExpression(var: !122, expr: !DIExpression(DW_OP_constu, 32768, DW_OP_stack_value))
!122 = distinct !DIGlobalVariable(name: "flag_num_got_decimal", scope: !2, file: !3, line: 434, type: !92, isLocal: true, isDefinition: true)
!123 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !43)
!124 = !{i32 2, !"Dwarf Version", i32 4}
!125 = !{i32 2, !"Debug Info Version", i32 3}
!126 = !{i32 1, !"wchar_size", i32 4}
!127 = !{!"clang version 8.0.1- (branches/release_80)"}
!128 = distinct !DISubprogram(name: "json_parse_ex", scope: !3, file: !3, line: 436, type: !129, scopeLine: 440, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !151)
!129 = !DISubroutineType(types: !130)
!130 = !{!41, !131, !149, !141, !35}
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !132, size: 64)
!132 = !DIDerivedType(tag: DW_TAG_typedef, name: "json_settings", file: !3, line: 43, baseType: !133)
!133 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 31, size: 384, elements: !134)
!134 = !{!135, !136, !137, !143, !147, !148}
!135 = !DIDerivedType(tag: DW_TAG_member, name: "max_memory", scope: !133, file: !3, line: 33, baseType: !88, size: 64)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "settings", scope: !133, file: !3, line: 34, baseType: !36, size: 32, offset: 64)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "mem_alloc", scope: !133, file: !3, line: 36, baseType: !138, size: 64, offset: 128)
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !139, size: 64)
!139 = !DISubroutineType(types: !140)
!140 = !{!39, !141, !36, !39}
!141 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !142, line: 62, baseType: !88)
!142 = !DIFile(filename: "/usr/lib/llvm-8/lib/clang/8.0.1/include/stddef.h", directory: "")
!143 = !DIDerivedType(tag: DW_TAG_member, name: "mem_free", scope: !133, file: !3, line: 37, baseType: !144, size: 64, offset: 192)
!144 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !145, size: 64)
!145 = !DISubroutineType(types: !146)
!146 = !{null, !39, !39}
!147 = !DIDerivedType(tag: DW_TAG_member, name: "user_data", scope: !133, file: !3, line: 39, baseType: !39, size: 64, offset: 256)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "value_extra", scope: !133, file: !3, line: 41, baseType: !141, size: 64, offset: 320)
!149 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !150, size: 64)
!150 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!151 = !{}
!152 = !DILocalVariable(name: "settings", arg: 1, scope: !128, file: !3, line: 436, type: !131)
!153 = !DILocation(line: 436, column: 45, scope: !128)
!154 = !DILocalVariable(name: "json", arg: 2, scope: !128, file: !3, line: 437, type: !149)
!155 = !DILocation(line: 437, column: 47, scope: !128)
!156 = !DILocalVariable(name: "length", arg: 3, scope: !128, file: !3, line: 438, type: !141)
!157 = !DILocation(line: 438, column: 36, scope: !128)
!158 = !DILocalVariable(name: "error_buf", arg: 4, scope: !128, file: !3, line: 439, type: !35)
!159 = !DILocation(line: 439, column: 36, scope: !128)
!160 = !DILocalVariable(name: "error", scope: !128, file: !3, line: 441, type: !161)
!161 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 1024, elements: !162)
!162 = !{!163}
!163 = !DISubrange(count: 128)
!164 = !DILocation(line: 441, column: 14, scope: !128)
!165 = !DILocalVariable(name: "end", scope: !128, file: !3, line: 442, type: !149)
!166 = !DILocation(line: 442, column: 22, scope: !128)
!167 = !DILocalVariable(name: "top", scope: !128, file: !3, line: 443, type: !41)
!168 = !DILocation(line: 443, column: 17, scope: !128)
!169 = !DILocalVariable(name: "root", scope: !128, file: !3, line: 443, type: !41)
!170 = !DILocation(line: 443, column: 24, scope: !128)
!171 = !DILocalVariable(name: "alloc", scope: !128, file: !3, line: 443, type: !41)
!172 = !DILocation(line: 443, column: 32, scope: !128)
!173 = !DILocalVariable(name: "state", scope: !128, file: !3, line: 444, type: !174)
!174 = !DIDerivedType(tag: DW_TAG_typedef, name: "json_state", file: !3, line: 284, baseType: !175)
!175 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 271, size: 768, elements: !176)
!176 = !{!177, !178, !179, !180, !181, !182, !183, !184}
!177 = !DIDerivedType(tag: DW_TAG_member, name: "used_memory", scope: !175, file: !3, line: 273, baseType: !88, size: 64)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "uint_max", scope: !175, file: !3, line: 275, baseType: !6, size: 32, offset: 64)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "ulong_max", scope: !175, file: !3, line: 276, baseType: !88, size: 64, offset: 128)
!180 = !DIDerivedType(tag: DW_TAG_member, name: "settings", scope: !175, file: !3, line: 278, baseType: !132, size: 384, offset: 192)
!181 = !DIDerivedType(tag: DW_TAG_member, name: "first_pass", scope: !175, file: !3, line: 279, baseType: !36, size: 32, offset: 576)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "ptr", scope: !175, file: !3, line: 281, baseType: !149, size: 64, offset: 640)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "cur_line", scope: !175, file: !3, line: 282, baseType: !6, size: 32, offset: 704)
!184 = !DIDerivedType(tag: DW_TAG_member, name: "cur_col", scope: !175, file: !3, line: 282, baseType: !6, size: 32, offset: 736)
!185 = !DILocation(line: 444, column: 15, scope: !128)
!186 = !DILocalVariable(name: "flags", scope: !128, file: !3, line: 445, type: !36)
!187 = !DILocation(line: 445, column: 8, scope: !128)
!188 = !DILocalVariable(name: "num_digits", scope: !128, file: !3, line: 446, type: !38)
!189 = !DILocation(line: 446, column: 11, scope: !128)
!190 = !DILocalVariable(name: "num_e", scope: !128, file: !3, line: 446, type: !38)
!191 = !DILocation(line: 446, column: 27, scope: !128)
!192 = !DILocalVariable(name: "num_fraction", scope: !128, file: !3, line: 447, type: !38)
!193 = !DILocation(line: 447, column: 11, scope: !128)
!194 = !DILocalVariable(name: "ZERO", scope: !128, file: !3, line: 449, type: !36)
!195 = !DILocation(line: 449, column: 8, scope: !128)
!196 = !DILocation(line: 449, column: 15, scope: !128)
!197 = !DILocation(line: 451, column: 8, scope: !198)
!198 = distinct !DILexicalBlock(scope: !128, file: !3, line: 451, column: 8)
!199 = !DILocation(line: 451, column: 15, scope: !198)
!200 = !DILocation(line: 451, column: 20, scope: !198)
!201 = !DILocation(line: 451, column: 40, scope: !198)
!202 = !DILocation(line: 451, column: 23, scope: !198)
!203 = !DILocation(line: 451, column: 50, scope: !198)
!204 = !DILocation(line: 452, column: 20, scope: !198)
!205 = !DILocation(line: 452, column: 40, scope: !198)
!206 = !DILocation(line: 452, column: 23, scope: !198)
!207 = !DILocation(line: 452, column: 50, scope: !198)
!208 = !DILocation(line: 453, column: 20, scope: !198)
!209 = !DILocation(line: 453, column: 40, scope: !198)
!210 = !DILocation(line: 453, column: 23, scope: !198)
!211 = !DILocation(line: 453, column: 50, scope: !198)
!212 = !DILocation(line: 451, column: 8, scope: !128)
!213 = !DILocation(line: 455, column: 12, scope: !214)
!214 = distinct !DILexicalBlock(scope: !198, file: !3, line: 454, column: 4)
!215 = !DILocation(line: 456, column: 14, scope: !214)
!216 = !DILocation(line: 457, column: 4, scope: !214)
!217 = !DILocation(line: 459, column: 4, scope: !128)
!218 = !DILocation(line: 459, column: 13, scope: !128)
!219 = !DILocation(line: 460, column: 11, scope: !128)
!220 = !DILocation(line: 460, column: 18, scope: !128)
!221 = !DILocation(line: 460, column: 16, scope: !128)
!222 = !DILocation(line: 460, column: 8, scope: !128)
!223 = !DILocation(line: 462, column: 19, scope: !128)
!224 = !DILocation(line: 462, column: 4, scope: !128)
!225 = !DILocation(line: 462, column: 29, scope: !128)
!226 = !DILocation(line: 464, column: 15, scope: !227)
!227 = distinct !DILexicalBlock(scope: !128, file: !3, line: 464, column: 8)
!228 = !DILocation(line: 464, column: 24, scope: !227)
!229 = !DILocation(line: 464, column: 9, scope: !227)
!230 = !DILocation(line: 464, column: 8, scope: !128)
!231 = !DILocation(line: 465, column: 13, scope: !227)
!232 = !DILocation(line: 465, column: 22, scope: !227)
!233 = !DILocation(line: 465, column: 32, scope: !227)
!234 = !DILocation(line: 465, column: 7, scope: !227)
!235 = !DILocation(line: 467, column: 15, scope: !236)
!236 = distinct !DILexicalBlock(scope: !128, file: !3, line: 467, column: 8)
!237 = !DILocation(line: 467, column: 24, scope: !236)
!238 = !DILocation(line: 467, column: 9, scope: !236)
!239 = !DILocation(line: 467, column: 8, scope: !128)
!240 = !DILocation(line: 468, column: 13, scope: !236)
!241 = !DILocation(line: 468, column: 22, scope: !236)
!242 = !DILocation(line: 468, column: 31, scope: !236)
!243 = !DILocation(line: 468, column: 7, scope: !236)
!244 = !DILocation(line: 470, column: 19, scope: !128)
!245 = !DILocation(line: 470, column: 4, scope: !128)
!246 = !DILocation(line: 471, column: 19, scope: !128)
!247 = !DILocation(line: 471, column: 4, scope: !128)
!248 = !DILocation(line: 473, column: 10, scope: !128)
!249 = !DILocation(line: 473, column: 19, scope: !128)
!250 = !DILocation(line: 474, column: 10, scope: !128)
!251 = !DILocation(line: 474, column: 20, scope: !128)
!252 = !DILocation(line: 476, column: 15, scope: !253)
!253 = distinct !DILexicalBlock(scope: !128, file: !3, line: 476, column: 4)
!254 = !DILocation(line: 476, column: 26, scope: !253)
!255 = !DILocation(line: 476, column: 9, scope: !253)
!256 = !DILocation(line: 476, column: 37, scope: !257)
!257 = distinct !DILexicalBlock(scope: !253, file: !3, line: 476, column: 4)
!258 = !DILocation(line: 476, column: 48, scope: !257)
!259 = !DILocation(line: 476, column: 4, scope: !253)
!260 = !DILocalVariable(name: "uchar", scope: !261, file: !3, line: 478, type: !262)
!261 = distinct !DILexicalBlock(scope: !257, file: !3, line: 477, column: 4)
!262 = !DIDerivedType(tag: DW_TAG_typedef, name: "json_uchar", file: !3, line: 16, baseType: !6)
!263 = !DILocation(line: 478, column: 18, scope: !261)
!264 = !DILocalVariable(name: "uc_b1", scope: !261, file: !3, line: 479, type: !32)
!265 = !DILocation(line: 479, column: 21, scope: !261)
!266 = !DILocalVariable(name: "uc_b2", scope: !261, file: !3, line: 479, type: !32)
!267 = !DILocation(line: 479, column: 28, scope: !261)
!268 = !DILocalVariable(name: "uc_b3", scope: !261, file: !3, line: 479, type: !32)
!269 = !DILocation(line: 479, column: 35, scope: !261)
!270 = !DILocalVariable(name: "uc_b4", scope: !261, file: !3, line: 479, type: !32)
!271 = !DILocation(line: 479, column: 42, scope: !261)
!272 = !DILocalVariable(name: "string", scope: !261, file: !3, line: 480, type: !35)
!273 = !DILocation(line: 480, column: 19, scope: !261)
!274 = !DILocalVariable(name: "string_length", scope: !261, file: !3, line: 481, type: !6)
!275 = !DILocation(line: 481, column: 20, scope: !261)
!276 = !DILocation(line: 483, column: 18, scope: !261)
!277 = !DILocation(line: 483, column: 11, scope: !261)
!278 = !DILocation(line: 484, column: 13, scope: !261)
!279 = !DILocation(line: 486, column: 13, scope: !261)
!280 = !DILocation(line: 486, column: 22, scope: !261)
!281 = !DILocation(line: 487, column: 24, scope: !282)
!282 = distinct !DILexicalBlock(scope: !261, file: !3, line: 487, column: 7)
!283 = !DILocation(line: 487, column: 18, scope: !282)
!284 = !DILocation(line: 487, column: 22, scope: !282)
!285 = !DILocation(line: 487, column: 12, scope: !282)
!286 = !DILocalVariable(name: "b", scope: !287, file: !3, line: 489, type: !33)
!287 = distinct !DILexicalBlock(scope: !288, file: !3, line: 488, column: 7)
!288 = distinct !DILexicalBlock(scope: !282, file: !3, line: 487, column: 7)
!289 = !DILocation(line: 489, column: 20, scope: !287)
!290 = !DILocation(line: 489, column: 31, scope: !287)
!291 = !DILocation(line: 489, column: 38, scope: !287)
!292 = !DILocation(line: 489, column: 35, scope: !287)
!293 = !DILocation(line: 489, column: 25, scope: !287)
!294 = !DILocation(line: 489, column: 55, scope: !287)
!295 = !DILocation(line: 489, column: 48, scope: !287)
!296 = !DILocation(line: 489, column: 24, scope: !287)
!297 = !DILocation(line: 491, column: 14, scope: !298)
!298 = distinct !DILexicalBlock(scope: !287, file: !3, line: 491, column: 14)
!299 = !DILocation(line: 491, column: 16, scope: !298)
!300 = !DILocation(line: 491, column: 14, scope: !287)
!301 = !DILocation(line: 492, column: 41, scope: !298)
!302 = !DILocation(line: 492, column: 45, scope: !298)
!303 = !DILocation(line: 492, column: 43, scope: !298)
!304 = !DILocation(line: 492, column: 13, scope: !298)
!305 = !DILocation(line: 494, column: 14, scope: !306)
!306 = distinct !DILexicalBlock(scope: !287, file: !3, line: 494, column: 14)
!307 = !DILocation(line: 494, column: 20, scope: !306)
!308 = !DILocation(line: 494, column: 14, scope: !287)
!309 = !DILocation(line: 496, column: 18, scope: !310)
!310 = distinct !DILexicalBlock(scope: !311, file: !3, line: 496, column: 17)
!311 = distinct !DILexicalBlock(scope: !306, file: !3, line: 495, column: 10)
!312 = !DILocation(line: 496, column: 17, scope: !311)
!313 = !DILocation(line: 497, column: 25, scope: !314)
!314 = distinct !DILexicalBlock(scope: !310, file: !3, line: 497, column: 13)
!315 = !DILocation(line: 497, column: 71, scope: !314)
!316 = !DILocation(line: 497, column: 16, scope: !314)
!317 = !DILocation(line: 498, column: 16, scope: !314)
!318 = !DILocation(line: 501, column: 17, scope: !319)
!319 = distinct !DILexicalBlock(scope: !311, file: !3, line: 501, column: 17)
!320 = !DILocation(line: 501, column: 39, scope: !319)
!321 = !DILocation(line: 501, column: 31, scope: !319)
!322 = !DILocation(line: 501, column: 17, scope: !311)
!323 = !DILocation(line: 502, column: 16, scope: !319)
!324 = !DILocation(line: 504, column: 15, scope: !325)
!325 = distinct !DILexicalBlock(scope: !311, file: !3, line: 504, column: 15)
!326 = !DILocation(line: 504, column: 21, scope: !325)
!327 = !DILocation(line: 504, column: 15, scope: !311)
!328 = !DILocation(line: 506, column: 22, scope: !329)
!329 = distinct !DILexicalBlock(scope: !325, file: !3, line: 505, column: 13)
!330 = !DILocation(line: 508, column: 24, scope: !329)
!331 = !DILocation(line: 508, column: 16, scope: !329)
!332 = !DILocation(line: 510, column: 30, scope: !333)
!333 = distinct !DILexicalBlock(scope: !329, file: !3, line: 509, column: 16)
!334 = !DILocation(line: 510, column: 30, scope: !335)
!335 = distinct !DILexicalBlock(scope: !336, file: !3, line: 510, column: 30)
!336 = distinct !DILexicalBlock(scope: !333, file: !3, line: 510, column: 30)
!337 = !DILocation(line: 510, column: 30, scope: !336)
!338 = !DILocation(line: 510, column: 50, scope: !333)
!339 = !DILocation(line: 511, column: 30, scope: !333)
!340 = !DILocation(line: 511, column: 30, scope: !341)
!341 = distinct !DILexicalBlock(scope: !342, file: !3, line: 511, column: 30)
!342 = distinct !DILexicalBlock(scope: !333, file: !3, line: 511, column: 30)
!343 = !DILocation(line: 511, column: 30, scope: !342)
!344 = !DILocation(line: 511, column: 50, scope: !333)
!345 = !DILocation(line: 512, column: 30, scope: !333)
!346 = !DILocation(line: 512, column: 30, scope: !347)
!347 = distinct !DILexicalBlock(scope: !348, file: !3, line: 512, column: 30)
!348 = distinct !DILexicalBlock(scope: !333, file: !3, line: 512, column: 30)
!349 = !DILocation(line: 512, column: 30, scope: !348)
!350 = !DILocation(line: 512, column: 50, scope: !333)
!351 = !DILocation(line: 513, column: 30, scope: !333)
!352 = !DILocation(line: 513, column: 30, scope: !353)
!353 = distinct !DILexicalBlock(scope: !354, file: !3, line: 513, column: 30)
!354 = distinct !DILexicalBlock(scope: !333, file: !3, line: 513, column: 30)
!355 = !DILocation(line: 513, column: 30, scope: !354)
!356 = !DILocation(line: 513, column: 50, scope: !333)
!357 = !DILocation(line: 514, column: 30, scope: !333)
!358 = !DILocation(line: 514, column: 30, scope: !359)
!359 = distinct !DILexicalBlock(scope: !360, file: !3, line: 514, column: 30)
!360 = distinct !DILexicalBlock(scope: !333, file: !3, line: 514, column: 30)
!361 = !DILocation(line: 514, column: 30, scope: !360)
!362 = !DILocation(line: 514, column: 50, scope: !333)
!363 = !DILocation(line: 516, column: 25, scope: !364)
!364 = distinct !DILexicalBlock(scope: !333, file: !3, line: 516, column: 25)
!365 = !DILocation(line: 516, column: 37, scope: !364)
!366 = !DILocation(line: 516, column: 29, scope: !364)
!367 = !DILocation(line: 516, column: 41, scope: !364)
!368 = !DILocation(line: 516, column: 46, scope: !364)
!369 = !DILocation(line: 517, column: 55, scope: !364)
!370 = !DILocation(line: 517, column: 46, scope: !364)
!371 = !DILocation(line: 517, column: 45, scope: !364)
!372 = !DILocation(line: 517, column: 34, scope: !364)
!373 = !DILocation(line: 517, column: 32, scope: !364)
!374 = !DILocation(line: 517, column: 25, scope: !364)
!375 = !DILocation(line: 517, column: 61, scope: !364)
!376 = !DILocation(line: 517, column: 69, scope: !364)
!377 = !DILocation(line: 518, column: 55, scope: !364)
!378 = !DILocation(line: 518, column: 46, scope: !364)
!379 = !DILocation(line: 518, column: 45, scope: !364)
!380 = !DILocation(line: 518, column: 34, scope: !364)
!381 = !DILocation(line: 518, column: 32, scope: !364)
!382 = !DILocation(line: 518, column: 25, scope: !364)
!383 = !DILocation(line: 518, column: 61, scope: !364)
!384 = !DILocation(line: 518, column: 69, scope: !364)
!385 = !DILocation(line: 519, column: 55, scope: !364)
!386 = !DILocation(line: 519, column: 46, scope: !364)
!387 = !DILocation(line: 519, column: 45, scope: !364)
!388 = !DILocation(line: 519, column: 34, scope: !364)
!389 = !DILocation(line: 519, column: 32, scope: !364)
!390 = !DILocation(line: 519, column: 25, scope: !364)
!391 = !DILocation(line: 519, column: 61, scope: !364)
!392 = !DILocation(line: 519, column: 69, scope: !364)
!393 = !DILocation(line: 520, column: 55, scope: !364)
!394 = !DILocation(line: 520, column: 46, scope: !364)
!395 = !DILocation(line: 520, column: 45, scope: !364)
!396 = !DILocation(line: 520, column: 34, scope: !364)
!397 = !DILocation(line: 520, column: 32, scope: !364)
!398 = !DILocation(line: 520, column: 25, scope: !364)
!399 = !DILocation(line: 520, column: 61, scope: !364)
!400 = !DILocation(line: 516, column: 25, scope: !333)
!401 = !DILocation(line: 522, column: 34, scope: !402)
!402 = distinct !DILexicalBlock(scope: !364, file: !3, line: 521, column: 21)
!403 = !DILocation(line: 522, column: 84, scope: !402)
!404 = !DILocation(line: 522, column: 87, scope: !402)
!405 = !DILocation(line: 522, column: 25, scope: !402)
!406 = !DILocation(line: 523, column: 25, scope: !402)
!407 = !DILocation(line: 526, column: 30, scope: !333)
!408 = !DILocation(line: 526, column: 36, scope: !333)
!409 = !DILocation(line: 526, column: 44, scope: !333)
!410 = !DILocation(line: 526, column: 42, scope: !333)
!411 = !DILocation(line: 526, column: 29, scope: !333)
!412 = !DILocation(line: 526, column: 27, scope: !333)
!413 = !DILocation(line: 527, column: 30, scope: !333)
!414 = !DILocation(line: 527, column: 36, scope: !333)
!415 = !DILocation(line: 527, column: 44, scope: !333)
!416 = !DILocation(line: 527, column: 42, scope: !333)
!417 = !DILocation(line: 527, column: 29, scope: !333)
!418 = !DILocation(line: 527, column: 27, scope: !333)
!419 = !DILocation(line: 528, column: 30, scope: !333)
!420 = !DILocation(line: 528, column: 36, scope: !333)
!421 = !DILocation(line: 528, column: 44, scope: !333)
!422 = !DILocation(line: 528, column: 42, scope: !333)
!423 = !DILocation(line: 528, column: 27, scope: !333)
!424 = !DILocation(line: 530, column: 26, scope: !425)
!425 = distinct !DILexicalBlock(scope: !333, file: !3, line: 530, column: 25)
!426 = !DILocation(line: 530, column: 32, scope: !425)
!427 = !DILocation(line: 530, column: 42, scope: !425)
!428 = !DILocation(line: 530, column: 25, scope: !333)
!429 = !DILocalVariable(name: "uchar2", scope: !430, file: !3, line: 531, type: !262)
!430 = distinct !DILexicalBlock(scope: !425, file: !3, line: 530, column: 53)
!431 = !DILocation(line: 531, column: 36, scope: !430)
!432 = !DILocation(line: 533, column: 29, scope: !433)
!433 = distinct !DILexicalBlock(scope: !430, file: !3, line: 533, column: 29)
!434 = !DILocation(line: 533, column: 41, scope: !433)
!435 = !DILocation(line: 533, column: 33, scope: !433)
!436 = !DILocation(line: 533, column: 45, scope: !433)
!437 = !DILocation(line: 533, column: 50, scope: !433)
!438 = !DILocation(line: 533, column: 64, scope: !433)
!439 = !DILocation(line: 533, column: 55, scope: !433)
!440 = !DILocation(line: 533, column: 54, scope: !433)
!441 = !DILocation(line: 533, column: 53, scope: !433)
!442 = !DILocation(line: 533, column: 69, scope: !433)
!443 = !DILocation(line: 533, column: 77, scope: !433)
!444 = !DILocation(line: 533, column: 91, scope: !433)
!445 = !DILocation(line: 533, column: 82, scope: !433)
!446 = !DILocation(line: 533, column: 81, scope: !433)
!447 = !DILocation(line: 533, column: 80, scope: !433)
!448 = !DILocation(line: 533, column: 96, scope: !433)
!449 = !DILocation(line: 533, column: 103, scope: !433)
!450 = !DILocation(line: 534, column: 59, scope: !433)
!451 = !DILocation(line: 534, column: 50, scope: !433)
!452 = !DILocation(line: 534, column: 49, scope: !433)
!453 = !DILocation(line: 534, column: 38, scope: !433)
!454 = !DILocation(line: 534, column: 36, scope: !433)
!455 = !DILocation(line: 534, column: 29, scope: !433)
!456 = !DILocation(line: 534, column: 65, scope: !433)
!457 = !DILocation(line: 534, column: 73, scope: !433)
!458 = !DILocation(line: 535, column: 59, scope: !433)
!459 = !DILocation(line: 535, column: 50, scope: !433)
!460 = !DILocation(line: 535, column: 49, scope: !433)
!461 = !DILocation(line: 535, column: 38, scope: !433)
!462 = !DILocation(line: 535, column: 36, scope: !433)
!463 = !DILocation(line: 535, column: 29, scope: !433)
!464 = !DILocation(line: 535, column: 65, scope: !433)
!465 = !DILocation(line: 535, column: 73, scope: !433)
!466 = !DILocation(line: 536, column: 59, scope: !433)
!467 = !DILocation(line: 536, column: 50, scope: !433)
!468 = !DILocation(line: 536, column: 49, scope: !433)
!469 = !DILocation(line: 536, column: 38, scope: !433)
!470 = !DILocation(line: 536, column: 36, scope: !433)
!471 = !DILocation(line: 536, column: 29, scope: !433)
!472 = !DILocation(line: 536, column: 65, scope: !433)
!473 = !DILocation(line: 536, column: 73, scope: !433)
!474 = !DILocation(line: 537, column: 59, scope: !433)
!475 = !DILocation(line: 537, column: 50, scope: !433)
!476 = !DILocation(line: 537, column: 49, scope: !433)
!477 = !DILocation(line: 537, column: 38, scope: !433)
!478 = !DILocation(line: 537, column: 36, scope: !433)
!479 = !DILocation(line: 537, column: 29, scope: !433)
!480 = !DILocation(line: 537, column: 65, scope: !433)
!481 = !DILocation(line: 533, column: 29, scope: !430)
!482 = !DILocation(line: 539, column: 38, scope: !483)
!483 = distinct !DILexicalBlock(scope: !433, file: !3, line: 538, column: 25)
!484 = !DILocation(line: 539, column: 88, scope: !483)
!485 = !DILocation(line: 539, column: 91, scope: !483)
!486 = !DILocation(line: 539, column: 29, scope: !483)
!487 = !DILocation(line: 540, column: 29, scope: !483)
!488 = !DILocation(line: 543, column: 34, scope: !430)
!489 = !DILocation(line: 543, column: 40, scope: !430)
!490 = !DILocation(line: 543, column: 48, scope: !430)
!491 = !DILocation(line: 543, column: 46, scope: !430)
!492 = !DILocation(line: 543, column: 33, scope: !430)
!493 = !DILocation(line: 543, column: 31, scope: !430)
!494 = !DILocation(line: 544, column: 34, scope: !430)
!495 = !DILocation(line: 544, column: 40, scope: !430)
!496 = !DILocation(line: 544, column: 48, scope: !430)
!497 = !DILocation(line: 544, column: 46, scope: !430)
!498 = !DILocation(line: 544, column: 33, scope: !430)
!499 = !DILocation(line: 544, column: 31, scope: !430)
!500 = !DILocation(line: 545, column: 35, scope: !430)
!501 = !DILocation(line: 545, column: 41, scope: !430)
!502 = !DILocation(line: 545, column: 49, scope: !430)
!503 = !DILocation(line: 545, column: 47, scope: !430)
!504 = !DILocation(line: 545, column: 32, scope: !430)
!505 = !DILocation(line: 547, column: 46, scope: !430)
!506 = !DILocation(line: 547, column: 52, scope: !430)
!507 = !DILocation(line: 547, column: 61, scope: !430)
!508 = !DILocation(line: 547, column: 42, scope: !430)
!509 = !DILocation(line: 547, column: 71, scope: !430)
!510 = !DILocation(line: 547, column: 78, scope: !430)
!511 = !DILocation(line: 547, column: 68, scope: !430)
!512 = !DILocation(line: 547, column: 31, scope: !430)
!513 = !DILocation(line: 548, column: 21, scope: !430)
!514 = !DILocation(line: 550, column: 71, scope: !515)
!515 = distinct !DILexicalBlock(scope: !333, file: !3, line: 550, column: 25)
!516 = !DILocation(line: 550, column: 77, scope: !515)
!517 = !DILocation(line: 550, column: 25, scope: !333)
!518 = !DILocation(line: 552, column: 24, scope: !519)
!519 = distinct !DILexicalBlock(scope: !515, file: !3, line: 551, column: 21)
!520 = !DILocation(line: 552, column: 24, scope: !521)
!521 = distinct !DILexicalBlock(scope: !522, file: !3, line: 552, column: 24)
!522 = distinct !DILexicalBlock(scope: !519, file: !3, line: 552, column: 24)
!523 = !DILocation(line: 552, column: 24, scope: !522)
!524 = !DILocation(line: 553, column: 24, scope: !519)
!525 = !DILocation(line: 556, column: 25, scope: !526)
!526 = distinct !DILexicalBlock(scope: !333, file: !3, line: 556, column: 25)
!527 = !DILocation(line: 556, column: 31, scope: !526)
!528 = !DILocation(line: 556, column: 25, scope: !333)
!529 = !DILocation(line: 558, column: 35, scope: !530)
!530 = distinct !DILexicalBlock(scope: !531, file: !3, line: 558, column: 29)
!531 = distinct !DILexicalBlock(scope: !526, file: !3, line: 557, column: 21)
!532 = !DILocation(line: 558, column: 29, scope: !530)
!533 = !DILocation(line: 558, column: 29, scope: !531)
!534 = !DILocation(line: 559, column: 42, scope: !530)
!535 = !DILocation(line: 559, column: 28, scope: !530)
!536 = !DILocation(line: 561, column: 64, scope: !537)
!537 = distinct !DILexicalBlock(scope: !530, file: !3, line: 561, column: 25)
!538 = !DILocation(line: 561, column: 70, scope: !537)
!539 = !DILocation(line: 561, column: 61, scope: !537)
!540 = !DILocation(line: 561, column: 56, scope: !537)
!541 = !DILocation(line: 561, column: 28, scope: !537)
!542 = !DILocation(line: 561, column: 50, scope: !537)
!543 = !DILocation(line: 561, column: 54, scope: !537)
!544 = !DILocation(line: 562, column: 64, scope: !537)
!545 = !DILocation(line: 562, column: 70, scope: !537)
!546 = !DILocation(line: 562, column: 61, scope: !537)
!547 = !DILocation(line: 562, column: 56, scope: !537)
!548 = !DILocation(line: 562, column: 28, scope: !537)
!549 = !DILocation(line: 562, column: 50, scope: !537)
!550 = !DILocation(line: 562, column: 54, scope: !537)
!551 = !DILocation(line: 565, column: 25, scope: !531)
!552 = !DILocation(line: 568, column: 25, scope: !553)
!553 = distinct !DILexicalBlock(scope: !333, file: !3, line: 568, column: 25)
!554 = !DILocation(line: 568, column: 31, scope: !553)
!555 = !DILocation(line: 568, column: 25, scope: !333)
!556 = !DILocation(line: 569, column: 35, scope: !557)
!557 = distinct !DILexicalBlock(scope: !558, file: !3, line: 569, column: 29)
!558 = distinct !DILexicalBlock(scope: !553, file: !3, line: 568, column: 42)
!559 = !DILocation(line: 569, column: 29, scope: !557)
!560 = !DILocation(line: 569, column: 29, scope: !558)
!561 = !DILocation(line: 570, column: 42, scope: !557)
!562 = !DILocation(line: 570, column: 28, scope: !557)
!563 = !DILocation(line: 572, column: 64, scope: !564)
!564 = distinct !DILexicalBlock(scope: !557, file: !3, line: 572, column: 25)
!565 = !DILocation(line: 572, column: 70, scope: !564)
!566 = !DILocation(line: 572, column: 61, scope: !564)
!567 = !DILocation(line: 572, column: 56, scope: !564)
!568 = !DILocation(line: 572, column: 28, scope: !564)
!569 = !DILocation(line: 572, column: 50, scope: !564)
!570 = !DILocation(line: 572, column: 54, scope: !564)
!571 = !DILocation(line: 573, column: 65, scope: !564)
!572 = !DILocation(line: 573, column: 71, scope: !564)
!573 = !DILocation(line: 573, column: 77, scope: !564)
!574 = !DILocation(line: 573, column: 61, scope: !564)
!575 = !DILocation(line: 573, column: 56, scope: !564)
!576 = !DILocation(line: 573, column: 28, scope: !564)
!577 = !DILocation(line: 573, column: 50, scope: !564)
!578 = !DILocation(line: 573, column: 54, scope: !564)
!579 = !DILocation(line: 574, column: 64, scope: !564)
!580 = !DILocation(line: 574, column: 70, scope: !564)
!581 = !DILocation(line: 574, column: 61, scope: !564)
!582 = !DILocation(line: 574, column: 56, scope: !564)
!583 = !DILocation(line: 574, column: 28, scope: !564)
!584 = !DILocation(line: 574, column: 50, scope: !564)
!585 = !DILocation(line: 574, column: 54, scope: !564)
!586 = !DILocation(line: 577, column: 25, scope: !558)
!587 = !DILocation(line: 580, column: 31, scope: !588)
!588 = distinct !DILexicalBlock(scope: !333, file: !3, line: 580, column: 25)
!589 = !DILocation(line: 580, column: 25, scope: !588)
!590 = !DILocation(line: 580, column: 25, scope: !333)
!591 = !DILocation(line: 581, column: 38, scope: !588)
!592 = !DILocation(line: 581, column: 24, scope: !588)
!593 = !DILocation(line: 583, column: 60, scope: !594)
!594 = distinct !DILexicalBlock(scope: !588, file: !3, line: 583, column: 21)
!595 = !DILocation(line: 583, column: 66, scope: !594)
!596 = !DILocation(line: 583, column: 57, scope: !594)
!597 = !DILocation(line: 583, column: 52, scope: !594)
!598 = !DILocation(line: 583, column: 24, scope: !594)
!599 = !DILocation(line: 583, column: 46, scope: !594)
!600 = !DILocation(line: 583, column: 50, scope: !594)
!601 = !DILocation(line: 584, column: 61, scope: !594)
!602 = !DILocation(line: 584, column: 67, scope: !594)
!603 = !DILocation(line: 584, column: 74, scope: !594)
!604 = !DILocation(line: 584, column: 57, scope: !594)
!605 = !DILocation(line: 584, column: 52, scope: !594)
!606 = !DILocation(line: 584, column: 24, scope: !594)
!607 = !DILocation(line: 584, column: 46, scope: !594)
!608 = !DILocation(line: 584, column: 50, scope: !594)
!609 = !DILocation(line: 585, column: 61, scope: !594)
!610 = !DILocation(line: 585, column: 67, scope: !594)
!611 = !DILocation(line: 585, column: 73, scope: !594)
!612 = !DILocation(line: 585, column: 57, scope: !594)
!613 = !DILocation(line: 585, column: 52, scope: !594)
!614 = !DILocation(line: 585, column: 24, scope: !594)
!615 = !DILocation(line: 585, column: 46, scope: !594)
!616 = !DILocation(line: 585, column: 50, scope: !594)
!617 = !DILocation(line: 586, column: 60, scope: !594)
!618 = !DILocation(line: 586, column: 66, scope: !594)
!619 = !DILocation(line: 586, column: 57, scope: !594)
!620 = !DILocation(line: 586, column: 52, scope: !594)
!621 = !DILocation(line: 586, column: 24, scope: !594)
!622 = !DILocation(line: 586, column: 46, scope: !594)
!623 = !DILocation(line: 586, column: 50, scope: !594)
!624 = !DILocation(line: 589, column: 21, scope: !333)
!625 = !DILocation(line: 592, column: 22, scope: !333)
!626 = !DILocation(line: 592, column: 22, scope: !627)
!627 = distinct !DILexicalBlock(scope: !628, file: !3, line: 592, column: 22)
!628 = distinct !DILexicalBlock(scope: !333, file: !3, line: 592, column: 22)
!629 = !DILocation(line: 592, column: 22, scope: !628)
!630 = !DILocation(line: 593, column: 16, scope: !333)
!631 = !DILocation(line: 595, column: 16, scope: !329)
!632 = !DILocation(line: 598, column: 15, scope: !633)
!633 = distinct !DILexicalBlock(scope: !311, file: !3, line: 598, column: 15)
!634 = !DILocation(line: 598, column: 17, scope: !633)
!635 = !DILocation(line: 598, column: 15, scope: !311)
!636 = !DILocation(line: 600, column: 22, scope: !637)
!637 = distinct !DILexicalBlock(scope: !633, file: !3, line: 599, column: 13)
!638 = !DILocation(line: 601, column: 16, scope: !637)
!639 = !DILocation(line: 604, column: 17, scope: !640)
!640 = distinct !DILexicalBlock(scope: !311, file: !3, line: 604, column: 17)
!641 = !DILocation(line: 604, column: 19, scope: !640)
!642 = !DILocation(line: 604, column: 17, scope: !311)
!643 = !DILocation(line: 607, column: 27, scope: !644)
!644 = distinct !DILexicalBlock(scope: !645, file: !3, line: 607, column: 20)
!645 = distinct !DILexicalBlock(scope: !640, file: !3, line: 605, column: 13)
!646 = !DILocation(line: 607, column: 21, scope: !644)
!647 = !DILocation(line: 607, column: 20, scope: !645)
!648 = !DILocation(line: 608, column: 19, scope: !644)
!649 = !DILocation(line: 608, column: 27, scope: !644)
!650 = !DILocation(line: 608, column: 42, scope: !644)
!651 = !DILocation(line: 610, column: 22, scope: !645)
!652 = !DILocation(line: 611, column: 23, scope: !645)
!653 = !DILocation(line: 613, column: 24, scope: !645)
!654 = !DILocation(line: 613, column: 29, scope: !645)
!655 = !DILocation(line: 613, column: 16, scope: !645)
!656 = !DILocation(line: 617, column: 45, scope: !657)
!657 = distinct !DILexicalBlock(scope: !645, file: !3, line: 614, column: 16)
!658 = !DILocation(line: 617, column: 22, scope: !657)
!659 = !DILocation(line: 617, column: 27, scope: !657)
!660 = !DILocation(line: 617, column: 29, scope: !657)
!661 = !DILocation(line: 617, column: 36, scope: !657)
!662 = !DILocation(line: 617, column: 43, scope: !657)
!663 = !DILocation(line: 618, column: 28, scope: !657)
!664 = !DILocation(line: 620, column: 22, scope: !657)
!665 = !DILocation(line: 624, column: 32, scope: !666)
!666 = distinct !DILexicalBlock(scope: !657, file: !3, line: 624, column: 26)
!667 = !DILocation(line: 624, column: 26, scope: !666)
!668 = !DILocation(line: 624, column: 26, scope: !657)
!669 = !DILocation(line: 625, column: 68, scope: !666)
!670 = !DILocation(line: 625, column: 82, scope: !666)
!671 = !DILocation(line: 625, column: 43, scope: !666)
!672 = !DILocation(line: 625, column: 48, scope: !666)
!673 = !DILocation(line: 625, column: 50, scope: !666)
!674 = !DILocation(line: 625, column: 57, scope: !666)
!675 = !DILocation(line: 625, column: 26, scope: !666)
!676 = !DILocation(line: 625, column: 65, scope: !666)
!677 = !DILocation(line: 625, column: 25, scope: !666)
!678 = !DILocation(line: 629, column: 44, scope: !679)
!679 = distinct !DILexicalBlock(scope: !666, file: !3, line: 627, column: 22)
!680 = !DILocation(line: 629, column: 49, scope: !679)
!681 = !DILocation(line: 629, column: 59, scope: !679)
!682 = !DILocation(line: 628, column: 25, scope: !679)
!683 = !DILocation(line: 628, column: 30, scope: !679)
!684 = !DILocation(line: 628, column: 32, scope: !679)
!685 = !DILocation(line: 628, column: 39, scope: !679)
!686 = !DILocation(line: 628, column: 47, scope: !679)
!687 = !DILocation(line: 628, column: 52, scope: !679)
!688 = !DILocation(line: 628, column: 54, scope: !679)
!689 = !DILocation(line: 628, column: 61, scope: !679)
!690 = !DILocation(line: 628, column: 69, scope: !679)
!691 = !DILocation(line: 629, column: 28, scope: !679)
!692 = !DILocation(line: 632, column: 30, scope: !679)
!693 = !DILocation(line: 631, column: 25, scope: !679)
!694 = !DILocation(line: 631, column: 30, scope: !679)
!695 = !DILocation(line: 631, column: 32, scope: !679)
!696 = !DILocation(line: 631, column: 39, scope: !679)
!697 = !DILocation(line: 631, column: 47, scope: !679)
!698 = !DILocation(line: 631, column: 52, scope: !679)
!699 = !DILocation(line: 631, column: 54, scope: !679)
!700 = !DILocation(line: 631, column: 61, scope: !679)
!701 = !DILocation(line: 631, column: 69, scope: !679)
!702 = !DILocation(line: 632, column: 28, scope: !679)
!703 = !DILocation(line: 634, column: 73, scope: !679)
!704 = !DILocation(line: 634, column: 87, scope: !679)
!705 = !DILocation(line: 634, column: 43, scope: !679)
!706 = !DILocation(line: 634, column: 48, scope: !679)
!707 = !DILocation(line: 634, column: 58, scope: !679)
!708 = !DILocation(line: 634, column: 70, scope: !679)
!709 = !DILocation(line: 637, column: 28, scope: !657)
!710 = !DILocation(line: 638, column: 22, scope: !657)
!711 = !DILocation(line: 641, column: 22, scope: !657)
!712 = !DILocation(line: 643, column: 13, scope: !645)
!713 = !DILocation(line: 646, column: 16, scope: !714)
!714 = distinct !DILexicalBlock(scope: !640, file: !3, line: 645, column: 13)
!715 = !DILocation(line: 646, column: 16, scope: !716)
!716 = distinct !DILexicalBlock(scope: !717, file: !3, line: 646, column: 16)
!717 = distinct !DILexicalBlock(scope: !714, file: !3, line: 646, column: 16)
!718 = !DILocation(line: 646, column: 16, scope: !717)
!719 = !DILocation(line: 647, column: 16, scope: !714)
!720 = !DILocation(line: 649, column: 10, scope: !311)
!721 = !DILocation(line: 651, column: 20, scope: !722)
!722 = distinct !DILexicalBlock(scope: !287, file: !3, line: 651, column: 14)
!723 = !DILocation(line: 651, column: 29, scope: !722)
!724 = !DILocation(line: 651, column: 38, scope: !722)
!725 = !DILocation(line: 651, column: 14, scope: !287)
!726 = !DILocation(line: 653, column: 17, scope: !727)
!727 = distinct !DILexicalBlock(scope: !728, file: !3, line: 653, column: 17)
!728 = distinct !DILexicalBlock(scope: !722, file: !3, line: 652, column: 10)
!729 = !DILocation(line: 653, column: 23, scope: !727)
!730 = !DILocation(line: 653, column: 17, scope: !728)
!731 = !DILocation(line: 655, column: 20, scope: !732)
!732 = distinct !DILexicalBlock(scope: !733, file: !3, line: 655, column: 20)
!733 = distinct !DILexicalBlock(scope: !727, file: !3, line: 654, column: 13)
!734 = !DILocation(line: 655, column: 26, scope: !732)
!735 = !DILocation(line: 655, column: 20, scope: !733)
!736 = !DILocation(line: 657, column: 23, scope: !737)
!737 = distinct !DILexicalBlock(scope: !738, file: !3, line: 657, column: 23)
!738 = distinct !DILexicalBlock(scope: !732, file: !3, line: 656, column: 16)
!739 = !DILocation(line: 657, column: 25, scope: !737)
!740 = !DILocation(line: 657, column: 33, scope: !737)
!741 = !DILocation(line: 657, column: 36, scope: !737)
!742 = !DILocation(line: 657, column: 38, scope: !737)
!743 = !DILocation(line: 657, column: 46, scope: !737)
!744 = !DILocation(line: 657, column: 50, scope: !737)
!745 = !DILocation(line: 657, column: 23, scope: !738)
!746 = !DILocation(line: 659, column: 28, scope: !747)
!747 = distinct !DILexicalBlock(scope: !737, file: !3, line: 658, column: 19)
!748 = !DILocation(line: 660, column: 31, scope: !747)
!749 = !DILocation(line: 660, column: 22, scope: !747)
!750 = !DILocation(line: 661, column: 19, scope: !747)
!751 = !DILocation(line: 663, column: 19, scope: !738)
!752 = !DILocation(line: 666, column: 20, scope: !753)
!753 = distinct !DILexicalBlock(scope: !733, file: !3, line: 666, column: 20)
!754 = !DILocation(line: 666, column: 26, scope: !753)
!755 = !DILocation(line: 666, column: 20, scope: !733)
!756 = !DILocation(line: 668, column: 24, scope: !757)
!757 = distinct !DILexicalBlock(scope: !758, file: !3, line: 668, column: 23)
!758 = distinct !DILexicalBlock(scope: !753, file: !3, line: 667, column: 16)
!759 = !DILocation(line: 668, column: 23, scope: !758)
!760 = !DILocation(line: 669, column: 31, scope: !761)
!761 = distinct !DILexicalBlock(scope: !757, file: !3, line: 669, column: 19)
!762 = !DILocation(line: 669, column: 80, scope: !761)
!763 = !DILocation(line: 669, column: 22, scope: !761)
!764 = !DILocation(line: 670, column: 22, scope: !761)
!765 = !DILocation(line: 673, column: 23, scope: !766)
!766 = distinct !DILexicalBlock(scope: !758, file: !3, line: 673, column: 23)
!767 = !DILocation(line: 673, column: 25, scope: !766)
!768 = !DILocation(line: 673, column: 32, scope: !766)
!769 = !DILocation(line: 673, column: 41, scope: !766)
!770 = !DILocation(line: 673, column: 48, scope: !766)
!771 = !DILocation(line: 673, column: 52, scope: !766)
!772 = !DILocation(line: 673, column: 45, scope: !766)
!773 = !DILocation(line: 673, column: 57, scope: !766)
!774 = !DILocation(line: 673, column: 66, scope: !766)
!775 = !DILocation(line: 673, column: 60, scope: !766)
!776 = !DILocation(line: 673, column: 74, scope: !766)
!777 = !DILocation(line: 673, column: 23, scope: !758)
!778 = !DILocation(line: 675, column: 28, scope: !779)
!779 = distinct !DILexicalBlock(scope: !766, file: !3, line: 674, column: 19)
!780 = !DILocation(line: 676, column: 31, scope: !779)
!781 = !DILocation(line: 676, column: 22, scope: !779)
!782 = !DILocation(line: 677, column: 19, scope: !779)
!783 = !DILocation(line: 679, column: 19, scope: !758)
!784 = !DILocation(line: 681, column: 13, scope: !733)
!785 = !DILocation(line: 682, column: 22, scope: !786)
!786 = distinct !DILexicalBlock(scope: !727, file: !3, line: 682, column: 22)
!787 = !DILocation(line: 682, column: 24, scope: !786)
!788 = !DILocation(line: 682, column: 22, scope: !727)
!789 = !DILocation(line: 684, column: 23, scope: !790)
!790 = distinct !DILexicalBlock(scope: !791, file: !3, line: 684, column: 20)
!791 = distinct !DILexicalBlock(scope: !786, file: !3, line: 683, column: 13)
!792 = !DILocation(line: 684, column: 29, scope: !790)
!793 = !DILocation(line: 684, column: 62, scope: !790)
!794 = !DILocation(line: 684, column: 65, scope: !790)
!795 = !DILocation(line: 684, column: 70, scope: !790)
!796 = !DILocation(line: 684, column: 75, scope: !790)
!797 = !DILocation(line: 684, column: 20, scope: !791)
!798 = !DILocation(line: 685, column: 28, scope: !799)
!799 = distinct !DILexicalBlock(scope: !790, file: !3, line: 685, column: 16)
!800 = !DILocation(line: 685, column: 70, scope: !799)
!801 = !DILocation(line: 685, column: 19, scope: !799)
!802 = !DILocation(line: 686, column: 19, scope: !799)
!803 = !DILocation(line: 689, column: 29, scope: !804)
!804 = distinct !DILexicalBlock(scope: !791, file: !3, line: 689, column: 20)
!805 = !DILocation(line: 689, column: 20, scope: !804)
!806 = !DILocation(line: 689, column: 36, scope: !804)
!807 = !DILocation(line: 689, column: 33, scope: !804)
!808 = !DILocation(line: 689, column: 20, scope: !791)
!809 = !DILocation(line: 690, column: 28, scope: !810)
!810 = distinct !DILexicalBlock(scope: !804, file: !3, line: 690, column: 16)
!811 = !DILocation(line: 690, column: 60, scope: !810)
!812 = !DILocation(line: 690, column: 19, scope: !810)
!813 = !DILocation(line: 691, column: 19, scope: !810)
!814 = !DILocation(line: 694, column: 35, scope: !791)
!815 = !DILocation(line: 694, column: 28, scope: !791)
!816 = !DILocation(line: 694, column: 26, scope: !791)
!817 = !DILocation(line: 694, column: 24, scope: !791)
!818 = !DILocation(line: 694, column: 16, scope: !791)
!819 = !DILocation(line: 697, column: 28, scope: !820)
!820 = distinct !DILexicalBlock(scope: !791, file: !3, line: 695, column: 16)
!821 = !DILocation(line: 698, column: 22, scope: !820)
!822 = !DILocation(line: 701, column: 28, scope: !820)
!823 = !DILocation(line: 702, column: 22, scope: !820)
!824 = !DILocation(line: 705, column: 31, scope: !820)
!825 = !DILocation(line: 705, column: 92, scope: !820)
!826 = !DILocation(line: 705, column: 106, scope: !820)
!827 = !DILocation(line: 705, column: 22, scope: !820)
!828 = !DILocation(line: 706, column: 22, scope: !820)
!829 = !DILocation(line: 709, column: 10, scope: !728)
!830 = !DILocation(line: 711, column: 14, scope: !831)
!831 = distinct !DILexicalBlock(scope: !287, file: !3, line: 711, column: 14)
!832 = !DILocation(line: 711, column: 20, scope: !831)
!833 = !DILocation(line: 711, column: 14, scope: !287)
!834 = !DILocation(line: 713, column: 18, scope: !835)
!835 = distinct !DILexicalBlock(scope: !836, file: !3, line: 713, column: 17)
!836 = distinct !DILexicalBlock(scope: !831, file: !3, line: 712, column: 10)
!837 = !DILocation(line: 713, column: 17, scope: !836)
!838 = !DILocation(line: 714, column: 16, scope: !835)
!839 = !DILocation(line: 716, column: 21, scope: !836)
!840 = !DILocation(line: 716, column: 13, scope: !836)
!841 = !DILocation(line: 718, column: 16, scope: !842)
!842 = distinct !DILexicalBlock(scope: !836, file: !3, line: 717, column: 13)
!843 = !DILocation(line: 719, column: 19, scope: !842)
!844 = !DILocation(line: 723, column: 28, scope: !842)
!845 = !DILocation(line: 724, column: 34, scope: !842)
!846 = !DILocation(line: 724, column: 50, scope: !842)
!847 = !DILocation(line: 724, column: 59, scope: !842)
!848 = !DILocation(line: 723, column: 19, scope: !842)
!849 = !DILocation(line: 726, column: 19, scope: !842)
!850 = !DILocation(line: 730, column: 14, scope: !851)
!851 = distinct !DILexicalBlock(scope: !287, file: !3, line: 730, column: 14)
!852 = !DILocation(line: 730, column: 20, scope: !851)
!853 = !DILocation(line: 730, column: 14, scope: !287)
!854 = !DILocation(line: 732, column: 21, scope: !855)
!855 = distinct !DILexicalBlock(scope: !851, file: !3, line: 731, column: 10)
!856 = !DILocation(line: 732, column: 13, scope: !855)
!857 = !DILocation(line: 734, column: 16, scope: !858)
!858 = distinct !DILexicalBlock(scope: !855, file: !3, line: 733, column: 13)
!859 = !DILocation(line: 735, column: 19, scope: !858)
!860 = !DILocation(line: 739, column: 23, scope: !861)
!861 = distinct !DILexicalBlock(scope: !858, file: !3, line: 739, column: 23)
!862 = !DILocation(line: 739, column: 27, scope: !861)
!863 = !DILocation(line: 739, column: 30, scope: !861)
!864 = !DILocation(line: 739, column: 35, scope: !861)
!865 = !DILocation(line: 739, column: 40, scope: !861)
!866 = !DILocation(line: 739, column: 23, scope: !858)
!867 = !DILocation(line: 740, column: 31, scope: !868)
!868 = distinct !DILexicalBlock(scope: !861, file: !3, line: 739, column: 55)
!869 = !DILocation(line: 740, column: 37, scope: !868)
!870 = !DILocation(line: 740, column: 78, scope: !868)
!871 = !DILocation(line: 740, column: 30, scope: !868)
!872 = !DILocation(line: 740, column: 28, scope: !868)
!873 = !DILocation(line: 742, column: 26, scope: !874)
!874 = distinct !DILexicalBlock(scope: !868, file: !3, line: 742, column: 26)
!875 = !DILocation(line: 742, column: 31, scope: !874)
!876 = !DILocation(line: 742, column: 38, scope: !874)
!877 = !DILocation(line: 742, column: 41, scope: !874)
!878 = !DILocation(line: 742, column: 46, scope: !874)
!879 = !DILocation(line: 742, column: 54, scope: !874)
!880 = !DILocation(line: 742, column: 59, scope: !874)
!881 = !DILocation(line: 742, column: 73, scope: !874)
!882 = !DILocation(line: 743, column: 26, scope: !874)
!883 = !DILocation(line: 743, column: 31, scope: !874)
!884 = !DILocation(line: 743, column: 39, scope: !874)
!885 = !DILocation(line: 743, column: 46, scope: !874)
!886 = !DILocation(line: 743, column: 49, scope: !874)
!887 = !DILocation(line: 743, column: 54, scope: !874)
!888 = !DILocation(line: 743, column: 62, scope: !874)
!889 = !DILocation(line: 743, column: 70, scope: !874)
!890 = !DILocation(line: 743, column: 75, scope: !874)
!891 = !DILocation(line: 742, column: 26, scope: !868)
!892 = !DILocation(line: 744, column: 54, scope: !893)
!893 = distinct !DILexicalBlock(scope: !874, file: !3, line: 743, column: 90)
!894 = !DILocation(line: 744, column: 62, scope: !893)
!895 = !DILocation(line: 744, column: 60, scope: !893)
!896 = !DILocation(line: 744, column: 25, scope: !893)
!897 = !DILocation(line: 745, column: 22, scope: !893)
!898 = !DILocation(line: 746, column: 19, scope: !868)
!899 = !DILocation(line: 748, column: 31, scope: !900)
!900 = distinct !DILexicalBlock(scope: !861, file: !3, line: 748, column: 19)
!901 = !DILocation(line: 748, column: 61, scope: !900)
!902 = !DILocation(line: 748, column: 22, scope: !900)
!903 = !DILocation(line: 749, column: 22, scope: !900)
!904 = !DILocation(line: 752, column: 19, scope: !858)
!905 = !DILocation(line: 756, column: 23, scope: !906)
!906 = distinct !DILexicalBlock(scope: !858, file: !3, line: 756, column: 23)
!907 = !DILocation(line: 756, column: 29, scope: !906)
!908 = !DILocation(line: 756, column: 23, scope: !858)
!909 = !DILocation(line: 758, column: 26, scope: !910)
!910 = distinct !DILexicalBlock(scope: !911, file: !3, line: 758, column: 26)
!911 = distinct !DILexicalBlock(scope: !906, file: !3, line: 757, column: 19)
!912 = !DILocation(line: 758, column: 28, scope: !910)
!913 = !DILocation(line: 758, column: 26, scope: !911)
!914 = !DILocation(line: 759, column: 31, scope: !915)
!915 = distinct !DILexicalBlock(scope: !910, file: !3, line: 759, column: 22)
!916 = !DILocation(line: 760, column: 25, scope: !915)
!917 = !DILocation(line: 764, column: 34, scope: !918)
!918 = distinct !DILexicalBlock(scope: !910, file: !3, line: 763, column: 22)
!919 = !DILocation(line: 765, column: 40, scope: !918)
!920 = !DILocation(line: 765, column: 56, scope: !918)
!921 = !DILocation(line: 765, column: 65, scope: !918)
!922 = !DILocation(line: 764, column: 25, scope: !918)
!923 = !DILocation(line: 767, column: 25, scope: !918)
!924 = !DILocation(line: 771, column: 23, scope: !925)
!925 = distinct !DILexicalBlock(scope: !858, file: !3, line: 771, column: 23)
!926 = !DILocation(line: 771, column: 29, scope: !925)
!927 = !DILocation(line: 771, column: 23, scope: !858)
!928 = !DILocation(line: 773, column: 26, scope: !929)
!929 = distinct !DILexicalBlock(scope: !930, file: !3, line: 773, column: 26)
!930 = distinct !DILexicalBlock(scope: !925, file: !3, line: 772, column: 19)
!931 = !DILocation(line: 773, column: 28, scope: !929)
!932 = !DILocation(line: 773, column: 26, scope: !930)
!933 = !DILocation(line: 774, column: 31, scope: !934)
!934 = distinct !DILexicalBlock(scope: !929, file: !3, line: 774, column: 22)
!935 = !DILocation(line: 775, column: 25, scope: !934)
!936 = !DILocation(line: 779, column: 34, scope: !937)
!937 = distinct !DILexicalBlock(scope: !929, file: !3, line: 778, column: 22)
!938 = !DILocation(line: 780, column: 40, scope: !937)
!939 = !DILocation(line: 780, column: 56, scope: !937)
!940 = !DILocation(line: 780, column: 65, scope: !937)
!941 = !DILocation(line: 779, column: 25, scope: !937)
!942 = !DILocation(line: 782, column: 25, scope: !937)
!943 = !DILocation(line: 786, column: 25, scope: !858)
!944 = !DILocation(line: 788, column: 27, scope: !858)
!945 = !DILocation(line: 788, column: 19, scope: !858)
!946 = !DILocation(line: 792, column: 30, scope: !947)
!947 = distinct !DILexicalBlock(scope: !948, file: !3, line: 792, column: 29)
!948 = distinct !DILexicalBlock(scope: !858, file: !3, line: 789, column: 19)
!949 = !DILocation(line: 792, column: 29, scope: !948)
!950 = !DILocation(line: 793, column: 28, scope: !947)
!951 = !DILocation(line: 795, column: 25, scope: !948)
!952 = !DILocation(line: 799, column: 30, scope: !953)
!953 = distinct !DILexicalBlock(scope: !948, file: !3, line: 799, column: 29)
!954 = !DILocation(line: 799, column: 29, scope: !948)
!955 = !DILocation(line: 800, column: 28, scope: !953)
!956 = !DILocation(line: 802, column: 31, scope: !948)
!957 = !DILocation(line: 803, column: 25, scope: !948)
!958 = !DILocation(line: 807, column: 30, scope: !959)
!959 = distinct !DILexicalBlock(scope: !948, file: !3, line: 807, column: 29)
!960 = !DILocation(line: 807, column: 29, scope: !948)
!961 = !DILocation(line: 808, column: 28, scope: !959)
!962 = !DILocation(line: 810, column: 31, scope: !948)
!963 = !DILocation(line: 812, column: 34, scope: !948)
!964 = !DILocation(line: 812, column: 39, scope: !948)
!965 = !DILocation(line: 812, column: 41, scope: !948)
!966 = !DILocation(line: 812, column: 48, scope: !948)
!967 = !DILocation(line: 812, column: 32, scope: !948)
!968 = !DILocation(line: 813, column: 39, scope: !948)
!969 = !DILocation(line: 815, column: 25, scope: !948)
!970 = !DILocation(line: 819, column: 30, scope: !971)
!971 = distinct !DILexicalBlock(scope: !948, file: !3, line: 819, column: 29)
!972 = !DILocation(line: 819, column: 42, scope: !971)
!973 = !DILocation(line: 819, column: 34, scope: !971)
!974 = !DILocation(line: 819, column: 47, scope: !971)
!975 = !DILocation(line: 819, column: 51, scope: !971)
!976 = !DILocation(line: 819, column: 65, scope: !971)
!977 = !DILocation(line: 819, column: 56, scope: !971)
!978 = !DILocation(line: 819, column: 54, scope: !971)
!979 = !DILocation(line: 819, column: 70, scope: !971)
!980 = !DILocation(line: 819, column: 77, scope: !971)
!981 = !DILocation(line: 820, column: 40, scope: !971)
!982 = !DILocation(line: 820, column: 31, scope: !971)
!983 = !DILocation(line: 820, column: 29, scope: !971)
!984 = !DILocation(line: 820, column: 45, scope: !971)
!985 = !DILocation(line: 820, column: 52, scope: !971)
!986 = !DILocation(line: 820, column: 66, scope: !971)
!987 = !DILocation(line: 820, column: 57, scope: !971)
!988 = !DILocation(line: 820, column: 55, scope: !971)
!989 = !DILocation(line: 820, column: 71, scope: !971)
!990 = !DILocation(line: 819, column: 29, scope: !948)
!991 = !DILocation(line: 822, column: 28, scope: !992)
!992 = distinct !DILexicalBlock(scope: !971, file: !3, line: 821, column: 25)
!993 = !DILocation(line: 825, column: 30, scope: !994)
!994 = distinct !DILexicalBlock(scope: !948, file: !3, line: 825, column: 29)
!995 = !DILocation(line: 825, column: 29, scope: !948)
!996 = !DILocation(line: 826, column: 28, scope: !994)
!997 = !DILocation(line: 828, column: 25, scope: !948)
!998 = !DILocation(line: 828, column: 30, scope: !948)
!999 = !DILocation(line: 828, column: 32, scope: !948)
!1000 = !DILocation(line: 828, column: 40, scope: !948)
!1001 = !DILocation(line: 830, column: 31, scope: !948)
!1002 = !DILocation(line: 831, column: 25, scope: !948)
!1003 = !DILocation(line: 835, column: 30, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !948, file: !3, line: 835, column: 29)
!1005 = !DILocation(line: 835, column: 42, scope: !1004)
!1006 = !DILocation(line: 835, column: 34, scope: !1004)
!1007 = !DILocation(line: 835, column: 47, scope: !1004)
!1008 = !DILocation(line: 835, column: 51, scope: !1004)
!1009 = !DILocation(line: 835, column: 65, scope: !1004)
!1010 = !DILocation(line: 835, column: 56, scope: !1004)
!1011 = !DILocation(line: 835, column: 54, scope: !1004)
!1012 = !DILocation(line: 835, column: 70, scope: !1004)
!1013 = !DILocation(line: 835, column: 77, scope: !1004)
!1014 = !DILocation(line: 836, column: 40, scope: !1004)
!1015 = !DILocation(line: 836, column: 31, scope: !1004)
!1016 = !DILocation(line: 836, column: 29, scope: !1004)
!1017 = !DILocation(line: 836, column: 45, scope: !1004)
!1018 = !DILocation(line: 836, column: 52, scope: !1004)
!1019 = !DILocation(line: 836, column: 66, scope: !1004)
!1020 = !DILocation(line: 836, column: 57, scope: !1004)
!1021 = !DILocation(line: 836, column: 55, scope: !1004)
!1022 = !DILocation(line: 836, column: 71, scope: !1004)
!1023 = !DILocation(line: 836, column: 78, scope: !1004)
!1024 = !DILocation(line: 837, column: 40, scope: !1004)
!1025 = !DILocation(line: 837, column: 31, scope: !1004)
!1026 = !DILocation(line: 837, column: 29, scope: !1004)
!1027 = !DILocation(line: 837, column: 45, scope: !1004)
!1028 = !DILocation(line: 835, column: 29, scope: !948)
!1029 = !DILocation(line: 839, column: 28, scope: !1030)
!1030 = distinct !DILexicalBlock(scope: !1004, file: !3, line: 838, column: 25)
!1031 = !DILocation(line: 842, column: 30, scope: !1032)
!1032 = distinct !DILexicalBlock(scope: !948, file: !3, line: 842, column: 29)
!1033 = !DILocation(line: 842, column: 29, scope: !948)
!1034 = !DILocation(line: 843, column: 28, scope: !1032)
!1035 = !DILocation(line: 845, column: 31, scope: !948)
!1036 = !DILocation(line: 846, column: 25, scope: !948)
!1037 = !DILocation(line: 850, column: 30, scope: !1038)
!1038 = distinct !DILexicalBlock(scope: !948, file: !3, line: 850, column: 29)
!1039 = !DILocation(line: 850, column: 42, scope: !1038)
!1040 = !DILocation(line: 850, column: 34, scope: !1038)
!1041 = !DILocation(line: 850, column: 47, scope: !1038)
!1042 = !DILocation(line: 850, column: 51, scope: !1038)
!1043 = !DILocation(line: 850, column: 65, scope: !1038)
!1044 = !DILocation(line: 850, column: 56, scope: !1038)
!1045 = !DILocation(line: 850, column: 54, scope: !1038)
!1046 = !DILocation(line: 850, column: 70, scope: !1038)
!1047 = !DILocation(line: 850, column: 77, scope: !1038)
!1048 = !DILocation(line: 851, column: 40, scope: !1038)
!1049 = !DILocation(line: 851, column: 31, scope: !1038)
!1050 = !DILocation(line: 851, column: 29, scope: !1038)
!1051 = !DILocation(line: 851, column: 45, scope: !1038)
!1052 = !DILocation(line: 851, column: 52, scope: !1038)
!1053 = !DILocation(line: 851, column: 66, scope: !1038)
!1054 = !DILocation(line: 851, column: 57, scope: !1038)
!1055 = !DILocation(line: 851, column: 55, scope: !1038)
!1056 = !DILocation(line: 851, column: 71, scope: !1038)
!1057 = !DILocation(line: 850, column: 29, scope: !948)
!1058 = !DILocation(line: 853, column: 28, scope: !1059)
!1059 = distinct !DILexicalBlock(scope: !1038, file: !3, line: 852, column: 25)
!1060 = !DILocation(line: 856, column: 30, scope: !1061)
!1061 = distinct !DILexicalBlock(scope: !948, file: !3, line: 856, column: 29)
!1062 = !DILocation(line: 856, column: 29, scope: !948)
!1063 = !DILocation(line: 857, column: 28, scope: !1061)
!1064 = !DILocation(line: 859, column: 31, scope: !948)
!1065 = !DILocation(line: 860, column: 25, scope: !948)
!1066 = !DILocation(line: 864, column: 29, scope: !1067)
!1067 = distinct !DILexicalBlock(scope: !948, file: !3, line: 864, column: 29)
!1068 = !DILocation(line: 864, column: 41, scope: !1067)
!1069 = !DILocation(line: 864, column: 44, scope: !1067)
!1070 = !DILocation(line: 864, column: 46, scope: !1067)
!1071 = !DILocation(line: 864, column: 29, scope: !948)
!1072 = !DILocation(line: 866, column: 33, scope: !1073)
!1073 = distinct !DILexicalBlock(scope: !1074, file: !3, line: 866, column: 32)
!1074 = distinct !DILexicalBlock(scope: !1067, file: !3, line: 865, column: 25)
!1075 = !DILocation(line: 866, column: 32, scope: !1074)
!1076 = !DILocation(line: 867, column: 31, scope: !1073)
!1077 = !DILocation(line: 869, column: 39, scope: !1078)
!1078 = distinct !DILexicalBlock(scope: !1074, file: !3, line: 869, column: 32)
!1079 = !DILocation(line: 869, column: 33, scope: !1078)
!1080 = !DILocation(line: 869, column: 32, scope: !1074)
!1081 = !DILocation(line: 871, column: 31, scope: !1082)
!1082 = distinct !DILexicalBlock(scope: !1078, file: !3, line: 870, column: 28)
!1083 = !DILocation(line: 871, column: 38, scope: !1082)
!1084 = !DILocation(line: 871, column: 50, scope: !1082)
!1085 = !DILocation(line: 871, column: 53, scope: !1082)
!1086 = !DILocation(line: 871, column: 55, scope: !1082)
!1087 = !DILocation(line: 871, column: 62, scope: !1082)
!1088 = !DILocation(line: 871, column: 65, scope: !1082)
!1089 = !DILocation(line: 871, column: 67, scope: !1082)
!1090 = !DILocation(line: 872, column: 41, scope: !1082)
!1091 = !DILocation(line: 872, column: 44, scope: !1082)
!1092 = !DILocation(line: 872, column: 46, scope: !1082)
!1093 = !DILocation(line: 872, column: 53, scope: !1082)
!1094 = !DILocation(line: 872, column: 56, scope: !1082)
!1095 = !DILocation(line: 872, column: 58, scope: !1082)
!1096 = !DILocation(line: 872, column: 65, scope: !1082)
!1097 = !DILocation(line: 872, column: 68, scope: !1082)
!1098 = !DILocation(line: 872, column: 70, scope: !1082)
!1099 = !DILocation(line: 874, column: 49, scope: !1100)
!1100 = distinct !DILexicalBlock(scope: !1101, file: !3, line: 874, column: 39)
!1101 = distinct !DILexicalBlock(scope: !1082, file: !3, line: 873, column: 31)
!1102 = !DILocation(line: 874, column: 40, scope: !1100)
!1103 = !DILocation(line: 874, column: 57, scope: !1100)
!1104 = !DILocation(line: 874, column: 54, scope: !1100)
!1105 = !DILocation(line: 874, column: 39, scope: !1101)
!1106 = !DILocation(line: 876, column: 39, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1100, file: !3, line: 875, column: 34)
!1108 = !DILocation(line: 877, column: 37, scope: !1107)
!1109 = !DILocation(line: 880, column: 45, scope: !1101)
!1110 = !DILocation(line: 880, column: 38, scope: !1101)
!1111 = !DILocation(line: 880, column: 36, scope: !1101)
!1112 = distinct !{!1112, !1081, !1113}
!1113 = !DILocation(line: 881, column: 31, scope: !1082)
!1114 = !DILocation(line: 883, column: 37, scope: !1082)
!1115 = !DILocation(line: 884, column: 31, scope: !1082)
!1116 = !DILocation(line: 887, column: 34, scope: !1074)
!1117 = !DILocation(line: 891, column: 39, scope: !1074)
!1118 = !DILocation(line: 892, column: 41, scope: !1074)
!1119 = !DILocation(line: 893, column: 34, scope: !1074)
!1120 = !DILocation(line: 895, column: 32, scope: !1121)
!1121 = distinct !DILexicalBlock(scope: !1074, file: !3, line: 895, column: 32)
!1122 = !DILocation(line: 895, column: 34, scope: !1121)
!1123 = !DILocation(line: 895, column: 32, scope: !1074)
!1124 = !DILocation(line: 897, column: 37, scope: !1125)
!1125 = distinct !DILexicalBlock(scope: !1121, file: !3, line: 896, column: 28)
!1126 = !DILocation(line: 898, column: 31, scope: !1125)
!1127 = !DILocation(line: 901, column: 34, scope: !1074)
!1128 = !DILocation(line: 902, column: 28, scope: !1074)
!1129 = !DILocation(line: 905, column: 37, scope: !1130)
!1130 = distinct !DILexicalBlock(scope: !1067, file: !3, line: 905, column: 25)
!1131 = !DILocation(line: 905, column: 87, scope: !1130)
!1132 = !DILocation(line: 905, column: 101, scope: !1130)
!1133 = !DILocation(line: 905, column: 28, scope: !1130)
!1134 = !DILocation(line: 906, column: 28, scope: !1130)
!1135 = !DILocation(line: 909, column: 13, scope: !858)
!1136 = !DILocation(line: 910, column: 10, scope: !855)
!1137 = !DILocation(line: 913, column: 21, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !851, file: !3, line: 912, column: 10)
!1139 = !DILocation(line: 913, column: 26, scope: !1138)
!1140 = !DILocation(line: 913, column: 13, scope: !1138)
!1141 = !DILocation(line: 917, column: 24, scope: !1142)
!1142 = distinct !DILexicalBlock(scope: !1138, file: !3, line: 914, column: 13)
!1143 = !DILocation(line: 917, column: 16, scope: !1142)
!1144 = !DILocation(line: 919, column: 19, scope: !1145)
!1145 = distinct !DILexicalBlock(scope: !1142, file: !3, line: 918, column: 16)
!1146 = !DILocation(line: 920, column: 22, scope: !1145)
!1147 = !DILocation(line: 924, column: 26, scope: !1148)
!1148 = distinct !DILexicalBlock(scope: !1145, file: !3, line: 924, column: 26)
!1149 = !DILocation(line: 924, column: 32, scope: !1148)
!1150 = !DILocation(line: 924, column: 26, scope: !1145)
!1151 = !DILocation(line: 925, column: 34, scope: !1152)
!1152 = distinct !DILexicalBlock(scope: !1148, file: !3, line: 925, column: 22)
!1153 = !DILocation(line: 925, column: 72, scope: !1152)
!1154 = !DILocation(line: 925, column: 25, scope: !1152)
!1155 = !DILocation(line: 926, column: 25, scope: !1152)
!1156 = !DILocation(line: 929, column: 28, scope: !1145)
!1157 = !DILocation(line: 931, column: 45, scope: !1145)
!1158 = !DILocation(line: 931, column: 50, scope: !1145)
!1159 = !DILocation(line: 931, column: 60, scope: !1145)
!1160 = !DILocation(line: 931, column: 29, scope: !1145)
!1161 = !DILocation(line: 932, column: 36, scope: !1145)
!1162 = !DILocation(line: 934, column: 22, scope: !1145)
!1163 = !DILocation(line: 938, column: 31, scope: !1145)
!1164 = !DILocation(line: 938, column: 37, scope: !1145)
!1165 = !DILocation(line: 938, column: 58, scope: !1145)
!1166 = !DILocation(line: 938, column: 30, scope: !1145)
!1167 = !DILocation(line: 938, column: 28, scope: !1145)
!1168 = !DILocation(line: 940, column: 26, scope: !1169)
!1169 = distinct !DILexicalBlock(scope: !1145, file: !3, line: 940, column: 26)
!1170 = !DILocation(line: 940, column: 31, scope: !1169)
!1171 = !DILocation(line: 940, column: 33, scope: !1169)
!1172 = !DILocation(line: 940, column: 40, scope: !1169)
!1173 = !DILocation(line: 940, column: 47, scope: !1169)
!1174 = !DILocation(line: 940, column: 26, scope: !1145)
!1175 = !DILocation(line: 941, column: 53, scope: !1176)
!1176 = distinct !DILexicalBlock(scope: !1169, file: !3, line: 940, column: 53)
!1177 = !DILocation(line: 941, column: 61, scope: !1176)
!1178 = !DILocation(line: 941, column: 59, scope: !1176)
!1179 = !DILocation(line: 941, column: 25, scope: !1176)
!1180 = !DILocation(line: 942, column: 22, scope: !1176)
!1181 = !DILocation(line: 944, column: 22, scope: !1145)
!1182 = !DILocation(line: 948, column: 26, scope: !1183)
!1183 = distinct !DILexicalBlock(scope: !1145, file: !3, line: 948, column: 26)
!1184 = !DILocation(line: 948, column: 32, scope: !1183)
!1185 = !DILocation(line: 948, column: 26, scope: !1145)
!1186 = !DILocation(line: 950, column: 31, scope: !1187)
!1187 = distinct !DILexicalBlock(scope: !1183, file: !3, line: 949, column: 22)
!1188 = !DILocation(line: 951, column: 25, scope: !1187)
!1189 = !DILocation(line: 948, column: 34, scope: !1183)
!1190 = !DILocation(line: 955, column: 31, scope: !1145)
!1191 = !DILocation(line: 955, column: 74, scope: !1145)
!1192 = !DILocation(line: 955, column: 88, scope: !1145)
!1193 = !DILocation(line: 955, column: 22, scope: !1145)
!1194 = !DILocation(line: 956, column: 22, scope: !1145)
!1195 = !DILocation(line: 959, column: 16, scope: !1142)
!1196 = !DILocation(line: 964, column: 20, scope: !1197)
!1197 = distinct !DILexicalBlock(scope: !1142, file: !3, line: 964, column: 20)
!1198 = !DILocation(line: 964, column: 20, scope: !1142)
!1199 = !DILocation(line: 966, column: 19, scope: !1200)
!1200 = distinct !DILexicalBlock(scope: !1197, file: !3, line: 965, column: 16)
!1201 = !DILocation(line: 968, column: 23, scope: !1202)
!1202 = distinct !DILexicalBlock(scope: !1200, file: !3, line: 968, column: 23)
!1203 = !DILocation(line: 968, column: 28, scope: !1202)
!1204 = !DILocation(line: 968, column: 33, scope: !1202)
!1205 = !DILocation(line: 968, column: 49, scope: !1202)
!1206 = !DILocation(line: 968, column: 52, scope: !1202)
!1207 = !DILocation(line: 968, column: 58, scope: !1202)
!1208 = !DILocation(line: 968, column: 23, scope: !1200)
!1209 = !DILocation(line: 970, column: 29, scope: !1210)
!1210 = distinct !DILexicalBlock(scope: !1211, file: !3, line: 970, column: 26)
!1211 = distinct !DILexicalBlock(scope: !1202, file: !3, line: 969, column: 19)
!1212 = !DILocation(line: 970, column: 35, scope: !1210)
!1213 = !DILocation(line: 970, column: 26, scope: !1211)
!1214 = !DILocation(line: 972, column: 29, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1216, file: !3, line: 972, column: 29)
!1216 = distinct !DILexicalBlock(scope: !1210, file: !3, line: 971, column: 22)
!1217 = !DILocation(line: 972, column: 35, scope: !1215)
!1218 = !DILocation(line: 972, column: 29, scope: !1216)
!1219 = !DILocation(line: 973, column: 37, scope: !1220)
!1220 = distinct !DILexicalBlock(scope: !1215, file: !3, line: 973, column: 25)
!1221 = !DILocation(line: 973, column: 81, scope: !1220)
!1222 = !DILocation(line: 973, column: 95, scope: !1220)
!1223 = !DILocation(line: 973, column: 28, scope: !1220)
!1224 = !DILocation(line: 974, column: 28, scope: !1220)
!1225 = !DILocation(line: 977, column: 29, scope: !1226)
!1226 = distinct !DILexicalBlock(scope: !1216, file: !3, line: 977, column: 29)
!1227 = !DILocation(line: 977, column: 40, scope: !1226)
!1228 = !DILocation(line: 977, column: 45, scope: !1226)
!1229 = !DILocation(line: 977, column: 48, scope: !1226)
!1230 = !DILocation(line: 977, column: 50, scope: !1226)
!1231 = !DILocation(line: 977, column: 29, scope: !1216)
!1232 = !DILocation(line: 978, column: 34, scope: !1226)
!1233 = !DILocation(line: 978, column: 28, scope: !1226)
!1234 = !DILocation(line: 979, column: 22, scope: !1216)
!1235 = !DILocation(line: 982, column: 31, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1210, file: !3, line: 981, column: 22)
!1237 = !DILocation(line: 983, column: 34, scope: !1236)
!1238 = !DILocation(line: 983, column: 40, scope: !1236)
!1239 = !DILocation(line: 983, column: 49, scope: !1236)
!1240 = !DILocation(line: 983, column: 51, scope: !1236)
!1241 = !DILocation(line: 983, column: 48, scope: !1236)
!1242 = !DILocation(line: 983, column: 46, scope: !1236)
!1243 = !DILocation(line: 983, column: 31, scope: !1236)
!1244 = !DILocation(line: 984, column: 25, scope: !1236)
!1245 = !DILocation(line: 995, column: 40, scope: !1211)
!1246 = !DILocation(line: 995, column: 45, scope: !1211)
!1247 = !DILocation(line: 995, column: 47, scope: !1211)
!1248 = !DILocation(line: 995, column: 55, scope: !1211)
!1249 = !DILocation(line: 995, column: 64, scope: !1211)
!1250 = !DILocation(line: 995, column: 66, scope: !1211)
!1251 = !DILocation(line: 995, column: 63, scope: !1211)
!1252 = !DILocation(line: 995, column: 61, scope: !1211)
!1253 = !DILocation(line: 995, column: 22, scope: !1211)
!1254 = !DILocation(line: 995, column: 27, scope: !1211)
!1255 = !DILocation(line: 995, column: 29, scope: !1211)
!1256 = !DILocation(line: 995, column: 37, scope: !1211)
!1257 = !DILocation(line: 996, column: 22, scope: !1211)
!1258 = !DILocation(line: 999, column: 23, scope: !1259)
!1259 = distinct !DILexicalBlock(scope: !1200, file: !3, line: 999, column: 23)
!1260 = !DILocation(line: 999, column: 29, scope: !1259)
!1261 = !DILocation(line: 999, column: 23, scope: !1200)
!1262 = !DILocation(line: 1000, column: 38, scope: !1259)
!1263 = !DILocation(line: 1000, column: 51, scope: !1259)
!1264 = !DILocation(line: 1000, column: 60, scope: !1259)
!1265 = !DILocation(line: 1000, column: 62, scope: !1259)
!1266 = !DILocation(line: 1000, column: 59, scope: !1259)
!1267 = !DILocation(line: 1000, column: 57, scope: !1259)
!1268 = !DILocation(line: 1000, column: 35, scope: !1259)
!1269 = !DILocation(line: 1000, column: 22, scope: !1259)
!1270 = !DILocation(line: 1002, column: 36, scope: !1259)
!1271 = !DILocation(line: 1002, column: 41, scope: !1259)
!1272 = !DILocation(line: 1002, column: 43, scope: !1259)
!1273 = !DILocation(line: 1002, column: 47, scope: !1259)
!1274 = !DILocation(line: 1002, column: 56, scope: !1259)
!1275 = !DILocation(line: 1002, column: 58, scope: !1259)
!1276 = !DILocation(line: 1002, column: 55, scope: !1259)
!1277 = !DILocation(line: 1002, column: 53, scope: !1259)
!1278 = !DILocation(line: 1002, column: 22, scope: !1259)
!1279 = !DILocation(line: 1002, column: 27, scope: !1259)
!1280 = !DILocation(line: 1002, column: 29, scope: !1259)
!1281 = !DILocation(line: 1002, column: 33, scope: !1259)
!1282 = !DILocation(line: 1004, column: 19, scope: !1200)
!1283 = !DILocation(line: 1007, column: 20, scope: !1284)
!1284 = distinct !DILexicalBlock(scope: !1142, file: !3, line: 1007, column: 20)
!1285 = !DILocation(line: 1007, column: 22, scope: !1284)
!1286 = !DILocation(line: 1007, column: 29, scope: !1284)
!1287 = !DILocation(line: 1007, column: 32, scope: !1284)
!1288 = !DILocation(line: 1007, column: 34, scope: !1284)
!1289 = !DILocation(line: 1007, column: 20, scope: !1142)
!1290 = !DILocation(line: 1009, column: 25, scope: !1291)
!1291 = distinct !DILexicalBlock(scope: !1292, file: !3, line: 1009, column: 24)
!1292 = distinct !DILexicalBlock(scope: !1284, file: !3, line: 1008, column: 16)
!1293 = !DILocation(line: 1009, column: 31, scope: !1291)
!1294 = !DILocation(line: 1009, column: 45, scope: !1291)
!1295 = !DILocation(line: 1009, column: 50, scope: !1291)
!1296 = !DILocation(line: 1009, column: 56, scope: !1291)
!1297 = !DILocation(line: 1009, column: 24, scope: !1292)
!1298 = !DILocation(line: 1011, column: 28, scope: !1299)
!1299 = distinct !DILexicalBlock(scope: !1291, file: !3, line: 1010, column: 19)
!1300 = !DILocation(line: 1013, column: 26, scope: !1301)
!1301 = distinct !DILexicalBlock(scope: !1299, file: !3, line: 1013, column: 26)
!1302 = !DILocation(line: 1013, column: 28, scope: !1301)
!1303 = !DILocation(line: 1013, column: 26, scope: !1299)
!1304 = !DILocation(line: 1014, column: 31, scope: !1301)
!1305 = !DILocation(line: 1014, column: 25, scope: !1301)
!1306 = !DILocation(line: 1016, column: 22, scope: !1299)
!1307 = !DILocation(line: 1018, column: 16, scope: !1292)
!1308 = !DILocation(line: 1019, column: 25, scope: !1309)
!1309 = distinct !DILexicalBlock(scope: !1284, file: !3, line: 1019, column: 25)
!1310 = !DILocation(line: 1019, column: 27, scope: !1309)
!1311 = !DILocation(line: 1019, column: 34, scope: !1309)
!1312 = !DILocation(line: 1019, column: 37, scope: !1309)
!1313 = !DILocation(line: 1019, column: 42, scope: !1309)
!1314 = !DILocation(line: 1019, column: 47, scope: !1309)
!1315 = !DILocation(line: 1019, column: 25, scope: !1284)
!1316 = !DILocation(line: 1021, column: 24, scope: !1317)
!1317 = distinct !DILexicalBlock(scope: !1318, file: !3, line: 1021, column: 23)
!1318 = distinct !DILexicalBlock(scope: !1309, file: !3, line: 1020, column: 16)
!1319 = !DILocation(line: 1021, column: 23, scope: !1318)
!1320 = !DILocation(line: 1022, column: 31, scope: !1321)
!1321 = distinct !DILexicalBlock(scope: !1317, file: !3, line: 1022, column: 19)
!1322 = !DILocation(line: 1022, column: 74, scope: !1321)
!1323 = !DILocation(line: 1022, column: 22, scope: !1321)
!1324 = !DILocation(line: 1023, column: 22, scope: !1321)
!1325 = !DILocation(line: 1026, column: 19, scope: !1318)
!1326 = !DILocation(line: 1026, column: 24, scope: !1318)
!1327 = !DILocation(line: 1026, column: 29, scope: !1318)
!1328 = !DILocation(line: 1027, column: 41, scope: !1318)
!1329 = !DILocation(line: 1027, column: 46, scope: !1318)
!1330 = !DILocation(line: 1027, column: 48, scope: !1318)
!1331 = !DILocation(line: 1027, column: 32, scope: !1318)
!1332 = !DILocation(line: 1027, column: 19, scope: !1318)
!1333 = !DILocation(line: 1027, column: 24, scope: !1318)
!1334 = !DILocation(line: 1027, column: 26, scope: !1318)
!1335 = !DILocation(line: 1027, column: 30, scope: !1318)
!1336 = !DILocation(line: 1029, column: 25, scope: !1318)
!1337 = !DILocation(line: 1030, column: 30, scope: !1318)
!1338 = !DILocation(line: 1031, column: 19, scope: !1318)
!1339 = !DILocation(line: 1034, column: 23, scope: !1340)
!1340 = distinct !DILexicalBlock(scope: !1142, file: !3, line: 1034, column: 20)
!1341 = !DILocation(line: 1034, column: 29, scope: !1340)
!1342 = !DILocation(line: 1034, column: 20, scope: !1142)
!1343 = !DILocation(line: 1036, column: 23, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1345, file: !3, line: 1036, column: 23)
!1345 = distinct !DILexicalBlock(scope: !1340, file: !3, line: 1035, column: 16)
!1346 = !DILocation(line: 1036, column: 28, scope: !1344)
!1347 = !DILocation(line: 1036, column: 33, scope: !1344)
!1348 = !DILocation(line: 1036, column: 23, scope: !1345)
!1349 = !DILocation(line: 1038, column: 27, scope: !1350)
!1350 = distinct !DILexicalBlock(scope: !1351, file: !3, line: 1038, column: 26)
!1351 = distinct !DILexicalBlock(scope: !1344, file: !3, line: 1037, column: 19)
!1352 = !DILocation(line: 1038, column: 26, scope: !1351)
!1353 = !DILocation(line: 1039, column: 34, scope: !1354)
!1354 = distinct !DILexicalBlock(scope: !1350, file: !3, line: 1039, column: 22)
!1355 = !DILocation(line: 1039, column: 76, scope: !1354)
!1356 = !DILocation(line: 1039, column: 25, scope: !1354)
!1357 = !DILocation(line: 1040, column: 25, scope: !1354)
!1358 = !DILocation(line: 1043, column: 36, scope: !1351)
!1359 = !DILocation(line: 1043, column: 62, scope: !1351)
!1360 = !DILocation(line: 1043, column: 51, scope: !1351)
!1361 = !DILocation(line: 1043, column: 49, scope: !1351)
!1362 = !DILocation(line: 1043, column: 22, scope: !1351)
!1363 = !DILocation(line: 1043, column: 27, scope: !1351)
!1364 = !DILocation(line: 1043, column: 29, scope: !1351)
!1365 = !DILocation(line: 1043, column: 33, scope: !1351)
!1366 = !DILocation(line: 1044, column: 19, scope: !1351)
!1367 = !DILocation(line: 1046, column: 23, scope: !1368)
!1368 = distinct !DILexicalBlock(scope: !1345, file: !3, line: 1046, column: 23)
!1369 = !DILocation(line: 1046, column: 25, scope: !1368)
!1370 = !DILocation(line: 1046, column: 32, scope: !1368)
!1371 = !DILocation(line: 1046, column: 35, scope: !1368)
!1372 = !DILocation(line: 1046, column: 37, scope: !1368)
!1373 = !DILocation(line: 1046, column: 23, scope: !1345)
!1374 = !DILocation(line: 1048, column: 28, scope: !1375)
!1375 = distinct !DILexicalBlock(scope: !1368, file: !3, line: 1047, column: 19)
!1376 = !DILocation(line: 1050, column: 26, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1375, file: !3, line: 1050, column: 26)
!1378 = !DILocation(line: 1050, column: 31, scope: !1377)
!1379 = !DILocation(line: 1050, column: 36, scope: !1377)
!1380 = !DILocation(line: 1050, column: 26, scope: !1375)
!1381 = !DILocation(line: 1052, column: 25, scope: !1382)
!1382 = distinct !DILexicalBlock(scope: !1377, file: !3, line: 1051, column: 22)
!1383 = !DILocation(line: 1052, column: 30, scope: !1382)
!1384 = !DILocation(line: 1052, column: 35, scope: !1382)
!1385 = !DILocation(line: 1053, column: 47, scope: !1382)
!1386 = !DILocation(line: 1053, column: 52, scope: !1382)
!1387 = !DILocation(line: 1053, column: 54, scope: !1382)
!1388 = !DILocation(line: 1053, column: 38, scope: !1382)
!1389 = !DILocation(line: 1053, column: 25, scope: !1382)
!1390 = !DILocation(line: 1053, column: 30, scope: !1382)
!1391 = !DILocation(line: 1053, column: 32, scope: !1382)
!1392 = !DILocation(line: 1053, column: 36, scope: !1382)
!1393 = !DILocation(line: 1054, column: 22, scope: !1382)
!1394 = !DILocation(line: 1056, column: 33, scope: !1375)
!1395 = !DILocation(line: 1057, column: 28, scope: !1375)
!1396 = !DILocation(line: 1059, column: 22, scope: !1375)
!1397 = !DILocation(line: 1061, column: 16, scope: !1345)
!1398 = !DILocation(line: 1064, column: 24, scope: !1399)
!1399 = distinct !DILexicalBlock(scope: !1400, file: !3, line: 1064, column: 23)
!1400 = distinct !DILexicalBlock(scope: !1340, file: !3, line: 1063, column: 16)
!1401 = !DILocation(line: 1064, column: 23, scope: !1400)
!1402 = !DILocation(line: 1065, column: 31, scope: !1403)
!1403 = distinct !DILexicalBlock(scope: !1399, file: !3, line: 1065, column: 19)
!1404 = !DILocation(line: 1065, column: 73, scope: !1403)
!1405 = !DILocation(line: 1065, column: 22, scope: !1403)
!1406 = !DILocation(line: 1066, column: 22, scope: !1403)
!1407 = !DILocation(line: 1069, column: 45, scope: !1400)
!1408 = !DILocation(line: 1069, column: 51, scope: !1400)
!1409 = !DILocation(line: 1069, column: 77, scope: !1400)
!1410 = !DILocation(line: 1069, column: 75, scope: !1400)
!1411 = !DILocation(line: 1069, column: 85, scope: !1400)
!1412 = !DILocation(line: 1069, column: 33, scope: !1400)
!1413 = !DILocation(line: 1069, column: 19, scope: !1400)
!1414 = !DILocation(line: 1069, column: 24, scope: !1400)
!1415 = !DILocation(line: 1069, column: 26, scope: !1400)
!1416 = !DILocation(line: 1069, column: 30, scope: !1400)
!1417 = !DILocation(line: 1072, column: 20, scope: !1418)
!1418 = distinct !DILexicalBlock(scope: !1142, file: !3, line: 1072, column: 20)
!1419 = !DILocation(line: 1072, column: 26, scope: !1418)
!1420 = !DILocation(line: 1072, column: 20, scope: !1142)
!1421 = !DILocation(line: 1074, column: 23, scope: !1422)
!1422 = distinct !DILexicalBlock(scope: !1423, file: !3, line: 1074, column: 23)
!1423 = distinct !DILexicalBlock(scope: !1418, file: !3, line: 1073, column: 16)
!1424 = !DILocation(line: 1074, column: 28, scope: !1422)
!1425 = !DILocation(line: 1074, column: 33, scope: !1422)
!1426 = !DILocation(line: 1074, column: 23, scope: !1423)
!1427 = !DILocation(line: 1075, column: 41, scope: !1422)
!1428 = !DILocation(line: 1075, column: 46, scope: !1422)
!1429 = !DILocation(line: 1075, column: 48, scope: !1422)
!1430 = !DILocation(line: 1075, column: 39, scope: !1422)
!1431 = !DILocation(line: 1075, column: 22, scope: !1422)
!1432 = !DILocation(line: 1075, column: 27, scope: !1422)
!1433 = !DILocation(line: 1075, column: 29, scope: !1422)
!1434 = !DILocation(line: 1075, column: 37, scope: !1422)
!1435 = !DILocation(line: 1077, column: 37, scope: !1422)
!1436 = !DILocation(line: 1077, column: 42, scope: !1422)
!1437 = !DILocation(line: 1077, column: 44, scope: !1422)
!1438 = !DILocation(line: 1077, column: 35, scope: !1422)
!1439 = !DILocation(line: 1077, column: 22, scope: !1422)
!1440 = !DILocation(line: 1077, column: 27, scope: !1422)
!1441 = !DILocation(line: 1077, column: 29, scope: !1422)
!1442 = !DILocation(line: 1077, column: 33, scope: !1422)
!1443 = !DILocation(line: 1078, column: 16, scope: !1423)
!1444 = !DILocation(line: 1080, column: 22, scope: !1142)
!1445 = !DILocation(line: 1081, column: 16, scope: !1142)
!1446 = !DILocation(line: 1084, column: 16, scope: !1142)
!1447 = !DILocation(line: 1088, column: 14, scope: !1448)
!1448 = distinct !DILexicalBlock(scope: !287, file: !3, line: 1088, column: 14)
!1449 = !DILocation(line: 1088, column: 20, scope: !1448)
!1450 = !DILocation(line: 1088, column: 14, scope: !287)
!1451 = !DILocation(line: 1090, column: 19, scope: !1452)
!1452 = distinct !DILexicalBlock(scope: !1448, file: !3, line: 1089, column: 10)
!1453 = !DILocation(line: 1091, column: 22, scope: !1452)
!1454 = !DILocation(line: 1091, column: 13, scope: !1452)
!1455 = !DILocation(line: 1092, column: 10, scope: !1452)
!1456 = !DILocation(line: 1094, column: 14, scope: !1457)
!1457 = distinct !DILexicalBlock(scope: !287, file: !3, line: 1094, column: 14)
!1458 = !DILocation(line: 1094, column: 20, scope: !1457)
!1459 = !DILocation(line: 1094, column: 14, scope: !287)
!1460 = !DILocation(line: 1096, column: 22, scope: !1461)
!1461 = distinct !DILexicalBlock(scope: !1457, file: !3, line: 1095, column: 10)
!1462 = !DILocation(line: 1096, column: 28, scope: !1461)
!1463 = !DILocation(line: 1096, column: 43, scope: !1461)
!1464 = !DILocation(line: 1096, column: 21, scope: !1461)
!1465 = !DILocation(line: 1096, column: 19, scope: !1461)
!1466 = !DILocation(line: 1098, column: 18, scope: !1467)
!1467 = distinct !DILexicalBlock(scope: !1461, file: !3, line: 1098, column: 17)
!1468 = !DILocation(line: 1098, column: 23, scope: !1467)
!1469 = !DILocation(line: 1098, column: 17, scope: !1461)
!1470 = !DILocation(line: 1102, column: 22, scope: !1471)
!1471 = distinct !DILexicalBlock(scope: !1467, file: !3, line: 1099, column: 13)
!1472 = !DILocation(line: 1103, column: 16, scope: !1471)
!1473 = !DILocation(line: 1106, column: 17, scope: !1474)
!1474 = distinct !DILexicalBlock(scope: !1461, file: !3, line: 1106, column: 17)
!1475 = !DILocation(line: 1106, column: 22, scope: !1474)
!1476 = !DILocation(line: 1106, column: 30, scope: !1474)
!1477 = !DILocation(line: 1106, column: 35, scope: !1474)
!1478 = !DILocation(line: 1106, column: 17, scope: !1461)
!1479 = !DILocation(line: 1107, column: 22, scope: !1474)
!1480 = !DILocation(line: 1107, column: 16, scope: !1474)
!1481 = !DILocation(line: 1109, column: 24, scope: !1482)
!1482 = distinct !DILexicalBlock(scope: !1461, file: !3, line: 1109, column: 17)
!1483 = !DILocation(line: 1109, column: 18, scope: !1482)
!1484 = !DILocation(line: 1109, column: 17, scope: !1461)
!1485 = !DILocalVariable(name: "parent", scope: !1486, file: !3, line: 1111, type: !41)
!1486 = distinct !DILexicalBlock(scope: !1482, file: !3, line: 1110, column: 13)
!1487 = !DILocation(line: 1111, column: 29, scope: !1486)
!1488 = !DILocation(line: 1111, column: 38, scope: !1486)
!1489 = !DILocation(line: 1111, column: 43, scope: !1486)
!1490 = !DILocation(line: 1113, column: 24, scope: !1486)
!1491 = !DILocation(line: 1113, column: 32, scope: !1486)
!1492 = !DILocation(line: 1113, column: 16, scope: !1486)
!1493 = !DILocation(line: 1118, column: 59, scope: !1494)
!1494 = distinct !DILexicalBlock(scope: !1486, file: !3, line: 1114, column: 16)
!1495 = !DILocation(line: 1117, column: 22, scope: !1494)
!1496 = !DILocation(line: 1117, column: 30, scope: !1494)
!1497 = !DILocation(line: 1117, column: 32, scope: !1494)
!1498 = !DILocation(line: 1117, column: 39, scope: !1494)
!1499 = !DILocation(line: 1118, column: 26, scope: !1494)
!1500 = !DILocation(line: 1118, column: 34, scope: !1494)
!1501 = !DILocation(line: 1118, column: 36, scope: !1494)
!1502 = !DILocation(line: 1118, column: 43, scope: !1494)
!1503 = !DILocation(line: 1118, column: 51, scope: !1494)
!1504 = !DILocation(line: 1118, column: 57, scope: !1494)
!1505 = !DILocation(line: 1120, column: 22, scope: !1494)
!1506 = !DILocation(line: 1125, column: 55, scope: !1494)
!1507 = !DILocation(line: 1124, column: 22, scope: !1494)
!1508 = !DILocation(line: 1124, column: 30, scope: !1494)
!1509 = !DILocation(line: 1124, column: 32, scope: !1494)
!1510 = !DILocation(line: 1124, column: 38, scope: !1494)
!1511 = !DILocation(line: 1125, column: 29, scope: !1494)
!1512 = !DILocation(line: 1125, column: 37, scope: !1494)
!1513 = !DILocation(line: 1125, column: 39, scope: !1494)
!1514 = !DILocation(line: 1125, column: 45, scope: !1494)
!1515 = !DILocation(line: 1125, column: 53, scope: !1494)
!1516 = !DILocation(line: 1127, column: 22, scope: !1494)
!1517 = !DILocation(line: 1130, column: 22, scope: !1494)
!1518 = !DILocation(line: 1132, column: 13, scope: !1486)
!1519 = !DILocation(line: 1134, column: 22, scope: !1520)
!1520 = distinct !DILexicalBlock(scope: !1461, file: !3, line: 1134, column: 18)
!1521 = !DILocation(line: 1134, column: 27, scope: !1520)
!1522 = !DILocation(line: 1134, column: 35, scope: !1520)
!1523 = !DILocation(line: 1134, column: 37, scope: !1520)
!1524 = !DILocation(line: 1134, column: 43, scope: !1520)
!1525 = !DILocation(line: 1134, column: 19, scope: !1520)
!1526 = !DILocation(line: 1134, column: 59, scope: !1520)
!1527 = !DILocation(line: 1134, column: 51, scope: !1520)
!1528 = !DILocation(line: 1134, column: 18, scope: !1461)
!1529 = !DILocation(line: 1135, column: 16, scope: !1520)
!1530 = !DILocation(line: 1137, column: 19, scope: !1461)
!1531 = !DILocation(line: 1137, column: 24, scope: !1461)
!1532 = !DILocation(line: 1137, column: 17, scope: !1461)
!1533 = !DILocation(line: 1139, column: 13, scope: !1461)
!1534 = !DILocation(line: 1141, column: 7, scope: !287)
!1535 = !DILocation(line: 487, column: 41, scope: !288)
!1536 = !DILocation(line: 487, column: 32, scope: !288)
!1537 = !DILocation(line: 487, column: 7, scope: !288)
!1538 = distinct !{!1538, !1539, !1540}
!1539 = !DILocation(line: 487, column: 7, scope: !282)
!1540 = !DILocation(line: 1141, column: 7, scope: !282)
!1541 = !DILocation(line: 1143, column: 15, scope: !261)
!1542 = !DILocation(line: 1143, column: 13, scope: !261)
!1543 = !DILocation(line: 1144, column: 4, scope: !261)
!1544 = !DILocation(line: 476, column: 63, scope: !257)
!1545 = !DILocation(line: 476, column: 54, scope: !257)
!1546 = !DILocation(line: 476, column: 4, scope: !257)
!1547 = distinct !{!1547, !259, !1548}
!1548 = !DILocation(line: 1144, column: 4, scope: !253)
!1549 = !DILocation(line: 1145, column: 11, scope: !128)
!1550 = !DILocation(line: 1145, column: 4, scope: !128)
!1551 = !DILocation(line: 1148, column: 13, scope: !128)
!1552 = !DILocation(line: 1148, column: 44, scope: !128)
!1553 = !DILocation(line: 1148, column: 4, scope: !128)
!1554 = !DILocation(line: 1149, column: 4, scope: !128)
!1555 = !DILocation(line: 1152, column: 12, scope: !128)
!1556 = !DILocation(line: 1152, column: 4, scope: !128)
!1557 = !DILocation(line: 1153, column: 4, scope: !128)
!1558 = !DILocation(line: 1156, column: 13, scope: !128)
!1559 = !DILocation(line: 1156, column: 57, scope: !128)
!1560 = !DILocation(line: 1156, column: 4, scope: !128)
!1561 = !DILocation(line: 1157, column: 4, scope: !128)
!1562 = !DILocation(line: 1160, column: 8, scope: !1563)
!1563 = distinct !DILexicalBlock(scope: !128, file: !3, line: 1160, column: 8)
!1564 = !DILocation(line: 1160, column: 8, scope: !128)
!1565 = !DILocation(line: 1162, column: 11, scope: !1566)
!1566 = distinct !DILexicalBlock(scope: !1567, file: !3, line: 1162, column: 11)
!1567 = distinct !DILexicalBlock(scope: !1563, file: !3, line: 1161, column: 4)
!1568 = !DILocation(line: 1162, column: 11, scope: !1567)
!1569 = !DILocation(line: 1163, column: 18, scope: !1566)
!1570 = !DILocation(line: 1163, column: 29, scope: !1566)
!1571 = !DILocation(line: 1163, column: 10, scope: !1566)
!1572 = !DILocation(line: 1165, column: 18, scope: !1566)
!1573 = !DILocation(line: 1165, column: 10, scope: !1566)
!1574 = !DILocation(line: 1166, column: 4, scope: !1567)
!1575 = !DILocation(line: 1168, column: 14, scope: !1576)
!1576 = distinct !DILexicalBlock(scope: !128, file: !3, line: 1168, column: 8)
!1577 = !DILocation(line: 1168, column: 8, scope: !1576)
!1578 = !DILocation(line: 1168, column: 8, scope: !128)
!1579 = !DILocation(line: 1169, column: 15, scope: !1576)
!1580 = !DILocation(line: 1169, column: 13, scope: !1576)
!1581 = !DILocation(line: 1169, column: 7, scope: !1576)
!1582 = !DILocation(line: 1171, column: 4, scope: !128)
!1583 = !DILocation(line: 1171, column: 11, scope: !128)
!1584 = !DILocation(line: 1173, column: 13, scope: !1585)
!1585 = distinct !DILexicalBlock(scope: !128, file: !3, line: 1172, column: 4)
!1586 = !DILocation(line: 1173, column: 20, scope: !1585)
!1587 = !DILocation(line: 1173, column: 30, scope: !1585)
!1588 = !DILocation(line: 1173, column: 11, scope: !1585)
!1589 = !DILocation(line: 1174, column: 13, scope: !1585)
!1590 = !DILocation(line: 1174, column: 22, scope: !1585)
!1591 = !DILocation(line: 1174, column: 32, scope: !1585)
!1592 = !DILocation(line: 1174, column: 45, scope: !1585)
!1593 = !DILocation(line: 1174, column: 54, scope: !1585)
!1594 = !DILocation(line: 1174, column: 7, scope: !1585)
!1595 = !DILocation(line: 1175, column: 15, scope: !1585)
!1596 = !DILocation(line: 1175, column: 13, scope: !1585)
!1597 = distinct !{!1597, !1582, !1598}
!1598 = !DILocation(line: 1176, column: 4, scope: !128)
!1599 = !DILocation(line: 1178, column: 15, scope: !1600)
!1600 = distinct !DILexicalBlock(scope: !128, file: !3, line: 1178, column: 8)
!1601 = !DILocation(line: 1178, column: 9, scope: !1600)
!1602 = !DILocation(line: 1178, column: 8, scope: !128)
!1603 = !DILocation(line: 1179, column: 34, scope: !1600)
!1604 = !DILocation(line: 1179, column: 44, scope: !1600)
!1605 = !DILocation(line: 1179, column: 7, scope: !1600)
!1606 = !DILocation(line: 1181, column: 4, scope: !128)
!1607 = !DILocation(line: 1182, column: 1, scope: !128)
!1608 = distinct !DISubprogram(name: "default_alloc", scope: !3, file: !3, line: 286, type: !139, scopeLine: 287, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !151)
!1609 = !DILocalVariable(name: "size", arg: 1, scope: !1608, file: !3, line: 286, type: !141)
!1610 = !DILocation(line: 286, column: 37, scope: !1608)
!1611 = !DILocalVariable(name: "zero", arg: 2, scope: !1608, file: !3, line: 286, type: !36)
!1612 = !DILocation(line: 286, column: 47, scope: !1608)
!1613 = !DILocalVariable(name: "user_data", arg: 3, scope: !1608, file: !3, line: 286, type: !39)
!1614 = !DILocation(line: 286, column: 60, scope: !1608)
!1615 = !DILocation(line: 288, column: 11, scope: !1608)
!1616 = !DILocation(line: 288, column: 29, scope: !1608)
!1617 = !DILocation(line: 288, column: 18, scope: !1608)
!1618 = !DILocation(line: 288, column: 45, scope: !1608)
!1619 = !DILocation(line: 288, column: 37, scope: !1608)
!1620 = !DILocation(line: 288, column: 4, scope: !1608)
!1621 = distinct !DISubprogram(name: "default_free", scope: !3, file: !3, line: 291, type: !145, scopeLine: 292, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !151)
!1622 = !DILocalVariable(name: "ptr", arg: 1, scope: !1621, file: !3, line: 291, type: !39)
!1623 = !DILocation(line: 291, column: 34, scope: !1621)
!1624 = !DILocalVariable(name: "user_data", arg: 2, scope: !1621, file: !3, line: 291, type: !39)
!1625 = !DILocation(line: 291, column: 46, scope: !1621)
!1626 = !DILocation(line: 293, column: 10, scope: !1621)
!1627 = !DILocation(line: 293, column: 4, scope: !1621)
!1628 = !DILocation(line: 294, column: 1, scope: !1621)
!1629 = distinct !DISubprogram(name: "hex_value", scope: !3, file: !3, line: 250, type: !1630, scopeLine: 251, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !151)
!1630 = !DISubroutineType(types: !1631)
!1631 = !{!32, !33}
!1632 = !DILocalVariable(name: "c", arg: 1, scope: !1629, file: !3, line: 250, type: !33)
!1633 = !DILocation(line: 250, column: 43, scope: !1629)
!1634 = !DILocation(line: 252, column: 8, scope: !1635)
!1635 = distinct !DILexicalBlock(scope: !1629, file: !3, line: 252, column: 8)
!1636 = !DILocation(line: 252, column: 8, scope: !1629)
!1637 = !DILocation(line: 253, column: 14, scope: !1635)
!1638 = !DILocation(line: 253, column: 16, scope: !1635)
!1639 = !DILocation(line: 253, column: 7, scope: !1635)
!1640 = !DILocation(line: 255, column: 12, scope: !1629)
!1641 = !DILocation(line: 255, column: 4, scope: !1629)
!1642 = !DILocation(line: 256, column: 27, scope: !1643)
!1643 = distinct !DILexicalBlock(scope: !1629, file: !3, line: 255, column: 15)
!1644 = !DILocation(line: 257, column: 27, scope: !1643)
!1645 = !DILocation(line: 258, column: 27, scope: !1643)
!1646 = !DILocation(line: 259, column: 27, scope: !1643)
!1647 = !DILocation(line: 260, column: 27, scope: !1643)
!1648 = !DILocation(line: 261, column: 27, scope: !1643)
!1649 = !DILocation(line: 262, column: 16, scope: !1643)
!1650 = !DILocation(line: 264, column: 1, scope: !1629)
!1651 = distinct !DISubprogram(name: "new_value", scope: !3, file: !3, line: 310, type: !1652, scopeLine: 313, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !151)
!1652 = !DISubroutineType(types: !1653)
!1653 = !{!36, !1654, !40, !40, !40, !48}
!1654 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !174, size: 64)
!1655 = !DILocalVariable(name: "state", arg: 1, scope: !1651, file: !3, line: 310, type: !1654)
!1656 = !DILocation(line: 310, column: 36, scope: !1651)
!1657 = !DILocalVariable(name: "top", arg: 2, scope: !1651, file: !3, line: 311, type: !40)
!1658 = !DILocation(line: 311, column: 37, scope: !1651)
!1659 = !DILocalVariable(name: "root", arg: 3, scope: !1651, file: !3, line: 311, type: !40)
!1660 = !DILocation(line: 311, column: 56, scope: !1651)
!1661 = !DILocalVariable(name: "alloc", arg: 4, scope: !1651, file: !3, line: 311, type: !40)
!1662 = !DILocation(line: 311, column: 76, scope: !1651)
!1663 = !DILocalVariable(name: "type", arg: 5, scope: !1651, file: !3, line: 312, type: !48)
!1664 = !DILocation(line: 312, column: 33, scope: !1651)
!1665 = !DILocalVariable(name: "value", scope: !1651, file: !3, line: 314, type: !41)
!1666 = !DILocation(line: 314, column: 17, scope: !1651)
!1667 = !DILocalVariable(name: "values_size", scope: !1651, file: !3, line: 315, type: !36)
!1668 = !DILocation(line: 315, column: 8, scope: !1651)
!1669 = !DILocation(line: 317, column: 9, scope: !1670)
!1670 = distinct !DILexicalBlock(scope: !1651, file: !3, line: 317, column: 8)
!1671 = !DILocation(line: 317, column: 16, scope: !1670)
!1672 = !DILocation(line: 317, column: 8, scope: !1651)
!1673 = !DILocation(line: 319, column: 23, scope: !1674)
!1674 = distinct !DILexicalBlock(scope: !1670, file: !3, line: 318, column: 4)
!1675 = !DILocation(line: 319, column: 22, scope: !1674)
!1676 = !DILocation(line: 319, column: 16, scope: !1674)
!1677 = !DILocation(line: 319, column: 20, scope: !1674)
!1678 = !DILocation(line: 319, column: 13, scope: !1674)
!1679 = !DILocation(line: 320, column: 18, scope: !1674)
!1680 = !DILocation(line: 320, column: 17, scope: !1674)
!1681 = !DILocation(line: 320, column: 26, scope: !1674)
!1682 = !DILocation(line: 320, column: 36, scope: !1674)
!1683 = !DILocation(line: 320, column: 8, scope: !1674)
!1684 = !DILocation(line: 320, column: 14, scope: !1674)
!1685 = !DILocation(line: 322, column: 13, scope: !1686)
!1686 = distinct !DILexicalBlock(scope: !1674, file: !3, line: 322, column: 11)
!1687 = !DILocation(line: 322, column: 12, scope: !1686)
!1688 = !DILocation(line: 322, column: 11, scope: !1674)
!1689 = !DILocation(line: 323, column: 18, scope: !1686)
!1690 = !DILocation(line: 323, column: 11, scope: !1686)
!1691 = !DILocation(line: 323, column: 16, scope: !1686)
!1692 = !DILocation(line: 323, column: 10, scope: !1686)
!1693 = !DILocation(line: 325, column: 15, scope: !1674)
!1694 = !DILocation(line: 325, column: 22, scope: !1674)
!1695 = !DILocation(line: 325, column: 7, scope: !1674)
!1696 = !DILocation(line: 329, column: 17, scope: !1697)
!1697 = distinct !DILexicalBlock(scope: !1698, file: !3, line: 329, column: 17)
!1698 = distinct !DILexicalBlock(scope: !1674, file: !3, line: 326, column: 7)
!1699 = !DILocation(line: 329, column: 24, scope: !1697)
!1700 = !DILocation(line: 329, column: 26, scope: !1697)
!1701 = !DILocation(line: 329, column: 32, scope: !1697)
!1702 = !DILocation(line: 329, column: 39, scope: !1697)
!1703 = !DILocation(line: 329, column: 17, scope: !1698)
!1704 = !DILocation(line: 335, column: 16, scope: !1705)
!1705 = distinct !DILexicalBlock(scope: !1697, file: !3, line: 329, column: 45)
!1706 = !DILocation(line: 339, column: 17, scope: !1707)
!1707 = distinct !DILexicalBlock(scope: !1698, file: !3, line: 338, column: 17)
!1708 = !DILocation(line: 339, column: 24, scope: !1707)
!1709 = !DILocation(line: 339, column: 31, scope: !1707)
!1710 = !DILocation(line: 339, column: 33, scope: !1707)
!1711 = !DILocation(line: 339, column: 39, scope: !1707)
!1712 = !DILocation(line: 339, column: 46, scope: !1707)
!1713 = !DILocation(line: 338, column: 60, scope: !1707)
!1714 = !DILocation(line: 338, column: 44, scope: !1707)
!1715 = !DILocation(line: 338, column: 20, scope: !1707)
!1716 = !DILocation(line: 338, column: 27, scope: !1707)
!1717 = !DILocation(line: 338, column: 29, scope: !1707)
!1718 = !DILocation(line: 338, column: 35, scope: !1707)
!1719 = !DILocation(line: 338, column: 42, scope: !1707)
!1720 = !DILocation(line: 338, column: 17, scope: !1698)
!1721 = !DILocation(line: 341, column: 16, scope: !1722)
!1722 = distinct !DILexicalBlock(scope: !1707, file: !3, line: 340, column: 13)
!1723 = !DILocation(line: 344, column: 13, scope: !1698)
!1724 = !DILocation(line: 344, column: 20, scope: !1698)
!1725 = !DILocation(line: 344, column: 22, scope: !1698)
!1726 = !DILocation(line: 344, column: 28, scope: !1698)
!1727 = !DILocation(line: 344, column: 35, scope: !1698)
!1728 = !DILocation(line: 345, column: 13, scope: !1698)
!1729 = !DILocation(line: 349, column: 17, scope: !1730)
!1730 = distinct !DILexicalBlock(scope: !1698, file: !3, line: 349, column: 17)
!1731 = !DILocation(line: 349, column: 24, scope: !1730)
!1732 = !DILocation(line: 349, column: 26, scope: !1730)
!1733 = !DILocation(line: 349, column: 33, scope: !1730)
!1734 = !DILocation(line: 349, column: 40, scope: !1730)
!1735 = !DILocation(line: 349, column: 17, scope: !1698)
!1736 = !DILocation(line: 350, column: 16, scope: !1730)
!1737 = !DILocation(line: 352, column: 62, scope: !1698)
!1738 = !DILocation(line: 352, column: 69, scope: !1698)
!1739 = !DILocation(line: 352, column: 71, scope: !1698)
!1740 = !DILocation(line: 352, column: 78, scope: !1698)
!1741 = !DILocation(line: 352, column: 60, scope: !1698)
!1742 = !DILocation(line: 352, column: 27, scope: !1698)
!1743 = !DILocation(line: 352, column: 25, scope: !1698)
!1744 = !DILocation(line: 355, column: 20, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1698, file: !3, line: 354, column: 17)
!1746 = !DILocation(line: 355, column: 27, scope: !1745)
!1747 = !DILocation(line: 355, column: 58, scope: !1745)
!1748 = !DILocation(line: 355, column: 65, scope: !1745)
!1749 = !DILocation(line: 355, column: 67, scope: !1745)
!1750 = !DILocation(line: 355, column: 74, scope: !1745)
!1751 = !DILocation(line: 355, column: 42, scope: !1745)
!1752 = !DILocation(line: 355, column: 39, scope: !1745)
!1753 = !DILocation(line: 354, column: 67, scope: !1745)
!1754 = !DILocation(line: 354, column: 45, scope: !1745)
!1755 = !DILocation(line: 354, column: 20, scope: !1745)
!1756 = !DILocation(line: 354, column: 27, scope: !1745)
!1757 = !DILocation(line: 354, column: 29, scope: !1745)
!1758 = !DILocation(line: 354, column: 36, scope: !1745)
!1759 = !DILocation(line: 354, column: 43, scope: !1745)
!1760 = !DILocation(line: 354, column: 17, scope: !1698)
!1761 = !DILocation(line: 357, column: 16, scope: !1762)
!1762 = distinct !DILexicalBlock(scope: !1745, file: !3, line: 356, column: 13)
!1763 = !DILocation(line: 360, column: 56, scope: !1698)
!1764 = !DILocation(line: 360, column: 63, scope: !1698)
!1765 = !DILocation(line: 360, column: 65, scope: !1698)
!1766 = !DILocation(line: 360, column: 72, scope: !1698)
!1767 = !DILocation(line: 360, column: 44, scope: !1698)
!1768 = !DILocation(line: 360, column: 82, scope: !1698)
!1769 = !DILocation(line: 360, column: 80, scope: !1698)
!1770 = !DILocation(line: 360, column: 13, scope: !1698)
!1771 = !DILocation(line: 360, column: 20, scope: !1698)
!1772 = !DILocation(line: 360, column: 30, scope: !1698)
!1773 = !DILocation(line: 360, column: 41, scope: !1698)
!1774 = !DILocation(line: 362, column: 13, scope: !1698)
!1775 = !DILocation(line: 362, column: 20, scope: !1698)
!1776 = !DILocation(line: 362, column: 22, scope: !1698)
!1777 = !DILocation(line: 362, column: 29, scope: !1698)
!1778 = !DILocation(line: 362, column: 36, scope: !1698)
!1779 = !DILocation(line: 363, column: 13, scope: !1698)
!1780 = !DILocation(line: 368, column: 17, scope: !1781)
!1781 = distinct !DILexicalBlock(scope: !1698, file: !3, line: 367, column: 17)
!1782 = !DILocation(line: 368, column: 25, scope: !1781)
!1783 = !DILocation(line: 368, column: 32, scope: !1781)
!1784 = !DILocation(line: 368, column: 34, scope: !1781)
!1785 = !DILocation(line: 368, column: 41, scope: !1781)
!1786 = !DILocation(line: 368, column: 48, scope: !1781)
!1787 = !DILocation(line: 368, column: 24, scope: !1781)
!1788 = !DILocation(line: 368, column: 53, scope: !1781)
!1789 = !DILocation(line: 367, column: 56, scope: !1781)
!1790 = !DILocation(line: 367, column: 20, scope: !1781)
!1791 = !DILocation(line: 367, column: 27, scope: !1781)
!1792 = !DILocation(line: 367, column: 29, scope: !1781)
!1793 = !DILocation(line: 367, column: 36, scope: !1781)
!1794 = !DILocation(line: 367, column: 40, scope: !1781)
!1795 = !DILocation(line: 367, column: 17, scope: !1698)
!1796 = !DILocation(line: 370, column: 16, scope: !1797)
!1797 = distinct !DILexicalBlock(scope: !1781, file: !3, line: 369, column: 13)
!1798 = !DILocation(line: 373, column: 13, scope: !1698)
!1799 = !DILocation(line: 373, column: 20, scope: !1698)
!1800 = !DILocation(line: 373, column: 22, scope: !1698)
!1801 = !DILocation(line: 373, column: 29, scope: !1698)
!1802 = !DILocation(line: 373, column: 36, scope: !1698)
!1803 = !DILocation(line: 374, column: 13, scope: !1698)
!1804 = !DILocation(line: 377, column: 13, scope: !1698)
!1805 = !DILocation(line: 380, column: 7, scope: !1674)
!1806 = !DILocation(line: 384, column: 11, scope: !1807)
!1807 = distinct !DILexicalBlock(scope: !1651, file: !3, line: 383, column: 8)
!1808 = !DILocation(line: 384, column: 40, scope: !1807)
!1809 = !DILocation(line: 384, column: 47, scope: !1807)
!1810 = !DILocation(line: 384, column: 56, scope: !1807)
!1811 = !DILocation(line: 384, column: 38, scope: !1807)
!1812 = !DILocation(line: 383, column: 34, scope: !1807)
!1813 = !DILocation(line: 383, column: 19, scope: !1807)
!1814 = !DILocation(line: 383, column: 17, scope: !1807)
!1815 = !DILocation(line: 383, column: 8, scope: !1651)
!1816 = !DILocation(line: 386, column: 7, scope: !1817)
!1817 = distinct !DILexicalBlock(scope: !1807, file: !3, line: 385, column: 4)
!1818 = !DILocation(line: 389, column: 10, scope: !1819)
!1819 = distinct !DILexicalBlock(scope: !1651, file: !3, line: 389, column: 8)
!1820 = !DILocation(line: 389, column: 9, scope: !1819)
!1821 = !DILocation(line: 389, column: 8, scope: !1651)
!1822 = !DILocation(line: 390, column: 15, scope: !1819)
!1823 = !DILocation(line: 390, column: 8, scope: !1819)
!1824 = !DILocation(line: 390, column: 13, scope: !1819)
!1825 = !DILocation(line: 390, column: 7, scope: !1819)
!1826 = !DILocation(line: 392, column: 18, scope: !1651)
!1827 = !DILocation(line: 392, column: 4, scope: !1651)
!1828 = !DILocation(line: 392, column: 11, scope: !1651)
!1829 = !DILocation(line: 392, column: 16, scope: !1651)
!1830 = !DILocation(line: 393, column: 21, scope: !1651)
!1831 = !DILocation(line: 393, column: 20, scope: !1651)
!1832 = !DILocation(line: 393, column: 4, scope: !1651)
!1833 = !DILocation(line: 393, column: 11, scope: !1651)
!1834 = !DILocation(line: 393, column: 18, scope: !1651)
!1835 = !DILocation(line: 400, column: 9, scope: !1836)
!1836 = distinct !DILexicalBlock(scope: !1651, file: !3, line: 400, column: 8)
!1837 = !DILocation(line: 400, column: 8, scope: !1836)
!1838 = !DILocation(line: 400, column: 8, scope: !1651)
!1839 = !DILocation(line: 401, column: 40, scope: !1836)
!1840 = !DILocation(line: 401, column: 9, scope: !1836)
!1841 = !DILocation(line: 401, column: 8, scope: !1836)
!1842 = !DILocation(line: 401, column: 17, scope: !1836)
!1843 = !DILocation(line: 401, column: 27, scope: !1836)
!1844 = !DILocation(line: 401, column: 38, scope: !1836)
!1845 = !DILocation(line: 401, column: 7, scope: !1836)
!1846 = !DILocation(line: 403, column: 20, scope: !1651)
!1847 = !DILocation(line: 403, column: 14, scope: !1651)
!1848 = !DILocation(line: 403, column: 18, scope: !1651)
!1849 = !DILocation(line: 403, column: 5, scope: !1651)
!1850 = !DILocation(line: 403, column: 11, scope: !1651)
!1851 = !DILocation(line: 405, column: 4, scope: !1651)
!1852 = !DILocation(line: 406, column: 1, scope: !1651)
!1853 = distinct !DISubprogram(name: "json_value_free_ex", scope: !3, file: !3, line: 1190, type: !1854, scopeLine: 1191, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !151)
!1854 = !DISubroutineType(types: !1855)
!1855 = !{null, !131, !41}
!1856 = !DILocalVariable(name: "settings", arg: 1, scope: !1853, file: !3, line: 1190, type: !131)
!1857 = !DILocation(line: 1190, column: 42, scope: !1853)
!1858 = !DILocalVariable(name: "value", arg: 2, scope: !1853, file: !3, line: 1190, type: !41)
!1859 = !DILocation(line: 1190, column: 65, scope: !1853)
!1860 = !DILocalVariable(name: "cur_value", scope: !1853, file: !3, line: 1192, type: !41)
!1861 = !DILocation(line: 1192, column: 17, scope: !1853)
!1862 = !DILocation(line: 1194, column: 9, scope: !1863)
!1863 = distinct !DILexicalBlock(scope: !1853, file: !3, line: 1194, column: 8)
!1864 = !DILocation(line: 1194, column: 8, scope: !1853)
!1865 = !DILocation(line: 1195, column: 7, scope: !1863)
!1866 = !DILocation(line: 1197, column: 4, scope: !1853)
!1867 = !DILocation(line: 1197, column: 11, scope: !1853)
!1868 = !DILocation(line: 1197, column: 18, scope: !1853)
!1869 = !DILocation(line: 1199, column: 4, scope: !1853)
!1870 = !DILocation(line: 1199, column: 11, scope: !1853)
!1871 = !DILocation(line: 1201, column: 15, scope: !1872)
!1872 = distinct !DILexicalBlock(scope: !1853, file: !3, line: 1200, column: 4)
!1873 = !DILocation(line: 1201, column: 22, scope: !1872)
!1874 = !DILocation(line: 1201, column: 7, scope: !1872)
!1875 = !DILocation(line: 1205, column: 18, scope: !1876)
!1876 = distinct !DILexicalBlock(scope: !1877, file: !3, line: 1205, column: 17)
!1877 = distinct !DILexicalBlock(scope: !1872, file: !3, line: 1202, column: 7)
!1878 = !DILocation(line: 1205, column: 25, scope: !1876)
!1879 = !DILocation(line: 1205, column: 27, scope: !1876)
!1880 = !DILocation(line: 1205, column: 33, scope: !1876)
!1881 = !DILocation(line: 1205, column: 17, scope: !1877)
!1882 = !DILocation(line: 1207, column: 16, scope: !1883)
!1883 = distinct !DILexicalBlock(scope: !1876, file: !3, line: 1206, column: 13)
!1884 = !DILocation(line: 1207, column: 26, scope: !1883)
!1885 = !DILocation(line: 1207, column: 36, scope: !1883)
!1886 = !DILocation(line: 1207, column: 43, scope: !1883)
!1887 = !DILocation(line: 1207, column: 45, scope: !1883)
!1888 = !DILocation(line: 1207, column: 51, scope: !1883)
!1889 = !DILocation(line: 1207, column: 59, scope: !1883)
!1890 = !DILocation(line: 1207, column: 69, scope: !1883)
!1891 = !DILocation(line: 1208, column: 16, scope: !1883)
!1892 = !DILocation(line: 1211, column: 21, scope: !1877)
!1893 = !DILocation(line: 1211, column: 28, scope: !1877)
!1894 = !DILocation(line: 1211, column: 30, scope: !1877)
!1895 = !DILocation(line: 1211, column: 36, scope: !1877)
!1896 = !DILocation(line: 1211, column: 47, scope: !1877)
!1897 = !DILocation(line: 1211, column: 54, scope: !1877)
!1898 = !DILocation(line: 1211, column: 56, scope: !1877)
!1899 = !DILocation(line: 1211, column: 62, scope: !1877)
!1900 = !DILocation(line: 1211, column: 44, scope: !1877)
!1901 = !DILocation(line: 1211, column: 19, scope: !1877)
!1902 = !DILocation(line: 1212, column: 13, scope: !1877)
!1903 = distinct !{!1903, !1869, !1904}
!1904 = !DILocation(line: 1237, column: 4, scope: !1853)
!1905 = !DILocation(line: 1216, column: 18, scope: !1906)
!1906 = distinct !DILexicalBlock(scope: !1877, file: !3, line: 1216, column: 17)
!1907 = !DILocation(line: 1216, column: 25, scope: !1906)
!1908 = !DILocation(line: 1216, column: 27, scope: !1906)
!1909 = !DILocation(line: 1216, column: 34, scope: !1906)
!1910 = !DILocation(line: 1216, column: 17, scope: !1877)
!1911 = !DILocation(line: 1218, column: 16, scope: !1912)
!1912 = distinct !DILexicalBlock(scope: !1906, file: !3, line: 1217, column: 13)
!1913 = !DILocation(line: 1218, column: 26, scope: !1912)
!1914 = !DILocation(line: 1218, column: 36, scope: !1912)
!1915 = !DILocation(line: 1218, column: 43, scope: !1912)
!1916 = !DILocation(line: 1218, column: 45, scope: !1912)
!1917 = !DILocation(line: 1218, column: 52, scope: !1912)
!1918 = !DILocation(line: 1218, column: 60, scope: !1912)
!1919 = !DILocation(line: 1218, column: 70, scope: !1912)
!1920 = !DILocation(line: 1219, column: 16, scope: !1912)
!1921 = !DILocation(line: 1222, column: 21, scope: !1877)
!1922 = !DILocation(line: 1222, column: 28, scope: !1877)
!1923 = !DILocation(line: 1222, column: 30, scope: !1877)
!1924 = !DILocation(line: 1222, column: 37, scope: !1877)
!1925 = !DILocation(line: 1222, column: 48, scope: !1877)
!1926 = !DILocation(line: 1222, column: 55, scope: !1877)
!1927 = !DILocation(line: 1222, column: 57, scope: !1877)
!1928 = !DILocation(line: 1222, column: 64, scope: !1877)
!1929 = !DILocation(line: 1222, column: 45, scope: !1877)
!1930 = !DILocation(line: 1222, column: 72, scope: !1877)
!1931 = !DILocation(line: 1222, column: 19, scope: !1877)
!1932 = !DILocation(line: 1223, column: 13, scope: !1877)
!1933 = !DILocation(line: 1227, column: 13, scope: !1877)
!1934 = !DILocation(line: 1227, column: 23, scope: !1877)
!1935 = !DILocation(line: 1227, column: 33, scope: !1877)
!1936 = !DILocation(line: 1227, column: 40, scope: !1877)
!1937 = !DILocation(line: 1227, column: 42, scope: !1877)
!1938 = !DILocation(line: 1227, column: 49, scope: !1877)
!1939 = !DILocation(line: 1227, column: 54, scope: !1877)
!1940 = !DILocation(line: 1227, column: 64, scope: !1877)
!1941 = !DILocation(line: 1228, column: 13, scope: !1877)
!1942 = !DILocation(line: 1231, column: 13, scope: !1877)
!1943 = !DILocation(line: 1234, column: 19, scope: !1872)
!1944 = !DILocation(line: 1234, column: 17, scope: !1872)
!1945 = !DILocation(line: 1235, column: 15, scope: !1872)
!1946 = !DILocation(line: 1235, column: 22, scope: !1872)
!1947 = !DILocation(line: 1235, column: 13, scope: !1872)
!1948 = !DILocation(line: 1236, column: 7, scope: !1872)
!1949 = !DILocation(line: 1236, column: 17, scope: !1872)
!1950 = !DILocation(line: 1236, column: 27, scope: !1872)
!1951 = !DILocation(line: 1236, column: 38, scope: !1872)
!1952 = !DILocation(line: 1236, column: 48, scope: !1872)
!1953 = !DILocation(line: 1238, column: 1, scope: !1853)
!1954 = distinct !DISubprogram(name: "json_parse", scope: !3, file: !3, line: 1184, type: !1955, scopeLine: 1185, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !151)
!1955 = !DISubroutineType(types: !1956)
!1956 = !{!41, !149, !141}
!1957 = !DILocalVariable(name: "json", arg: 1, scope: !1954, file: !3, line: 1184, type: !149)
!1958 = !DILocation(line: 1184, column: 44, scope: !1954)
!1959 = !DILocalVariable(name: "length", arg: 2, scope: !1954, file: !3, line: 1184, type: !141)
!1960 = !DILocation(line: 1184, column: 57, scope: !1954)
!1961 = !DILocalVariable(name: "settings", scope: !1954, file: !3, line: 1186, type: !132)
!1962 = !DILocation(line: 1186, column: 18, scope: !1954)
!1963 = !DILocation(line: 1187, column: 37, scope: !1954)
!1964 = !DILocation(line: 1187, column: 43, scope: !1954)
!1965 = !DILocation(line: 1187, column: 11, scope: !1954)
!1966 = !DILocation(line: 1187, column: 4, scope: !1954)
!1967 = distinct !DISubprogram(name: "json_value_free", scope: !3, file: !3, line: 1240, type: !1968, scopeLine: 1241, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !151)
!1968 = !DISubroutineType(types: !1969)
!1969 = !{null, !41}
!1970 = !DILocalVariable(name: "value", arg: 1, scope: !1967, file: !3, line: 1240, type: !41)
!1971 = !DILocation(line: 1240, column: 36, scope: !1967)
!1972 = !DILocalVariable(name: "settings", scope: !1967, file: !3, line: 1242, type: !132)
!1973 = !DILocation(line: 1242, column: 18, scope: !1967)
!1974 = !DILocation(line: 1243, column: 13, scope: !1967)
!1975 = !DILocation(line: 1243, column: 22, scope: !1967)
!1976 = !DILocation(line: 1244, column: 35, scope: !1967)
!1977 = !DILocation(line: 1244, column: 4, scope: !1967)
!1978 = !DILocation(line: 1245, column: 1, scope: !1967)
!1979 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 1247, type: !1980, scopeLine: 1248, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !151)
!1980 = !DISubroutineType(types: !1981)
!1981 = !{!36, !36, !34}
!1982 = !DILocalVariable(name: "argc", arg: 1, scope: !1979, file: !3, line: 1247, type: !36)
!1983 = !DILocation(line: 1247, column: 14, scope: !1979)
!1984 = !DILocalVariable(name: "argv", arg: 2, scope: !1979, file: !3, line: 1247, type: !34)
!1985 = !DILocation(line: 1247, column: 27, scope: !1979)
!1986 = !DILocalVariable(name: "file_size", scope: !1979, file: !3, line: 1249, type: !36)
!1987 = !DILocation(line: 1249, column: 8, scope: !1979)
!1988 = !DILocalVariable(name: "json", scope: !1979, file: !3, line: 1250, type: !35)
!1989 = !DILocation(line: 1250, column: 15, scope: !1979)
!1990 = !DILocalVariable(name: "value", scope: !1979, file: !3, line: 1251, type: !41)
!1991 = !DILocation(line: 1251, column: 16, scope: !1979)
!1992 = !DILocalVariable(name: "file_contents", scope: !1979, file: !3, line: 1253, type: !1993)
!1993 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 524288, elements: !1994)
!1994 = !{!1995}
!1995 = !DISubrange(count: 65536)
!1996 = !DILocation(line: 1253, column: 9, scope: !1979)
!1997 = !DILocation(line: 1254, column: 10, scope: !1979)
!1998 = !DILocation(line: 1254, column: 48, scope: !1979)
!1999 = !DILocation(line: 1254, column: 4, scope: !1979)
!2000 = !DILocation(line: 1255, column: 23, scope: !1979)
!2001 = !DILocation(line: 1255, column: 16, scope: !1979)
!2002 = !DILocation(line: 1255, column: 14, scope: !1979)
!2003 = !DILocation(line: 1257, column: 23, scope: !1979)
!2004 = !DILocation(line: 1257, column: 9, scope: !1979)
!2005 = !DILocation(line: 1259, column: 23, scope: !1979)
!2006 = !DILocation(line: 1259, column: 28, scope: !1979)
!2007 = !DILocation(line: 1259, column: 12, scope: !1979)
!2008 = !DILocation(line: 1259, column: 10, scope: !1979)
!2009 = !DILocation(line: 1261, column: 8, scope: !2010)
!2010 = distinct !DILexicalBlock(scope: !1979, file: !3, line: 1261, column: 8)
!2011 = !DILocation(line: 1261, column: 14, scope: !2010)
!2012 = !DILocation(line: 1261, column: 8, scope: !1979)
!2013 = !DILocation(line: 1262, column: 14, scope: !2014)
!2014 = distinct !DILexicalBlock(scope: !2010, file: !3, line: 1261, column: 23)
!2015 = !DILocation(line: 1262, column: 6, scope: !2014)
!2016 = !DILocation(line: 1263, column: 6, scope: !2014)
!2017 = !DILocation(line: 1266, column: 20, scope: !1979)
!2018 = !DILocation(line: 1266, column: 4, scope: !1979)
!2019 = !DILocation(line: 1267, column: 4, scope: !1979)
!2020 = distinct !DISubprogram(name: "json_alloc", scope: !3, file: !3, line: 296, type: !2021, scopeLine: 297, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !151)
!2021 = !DISubroutineType(types: !2022)
!2022 = !{!39, !1654, !88, !36}
!2023 = !DILocalVariable(name: "state", arg: 1, scope: !2020, file: !3, line: 296, type: !1654)
!2024 = !DILocation(line: 296, column: 40, scope: !2020)
!2025 = !DILocalVariable(name: "size", arg: 2, scope: !2020, file: !3, line: 296, type: !88)
!2026 = !DILocation(line: 296, column: 61, scope: !2020)
!2027 = !DILocalVariable(name: "zero", arg: 3, scope: !2020, file: !3, line: 296, type: !36)
!2028 = !DILocation(line: 296, column: 71, scope: !2020)
!2029 = !DILocation(line: 298, column: 9, scope: !2030)
!2030 = distinct !DILexicalBlock(scope: !2020, file: !3, line: 298, column: 8)
!2031 = !DILocation(line: 298, column: 16, scope: !2030)
!2032 = !DILocation(line: 298, column: 28, scope: !2030)
!2033 = !DILocation(line: 298, column: 35, scope: !2030)
!2034 = !DILocation(line: 298, column: 26, scope: !2030)
!2035 = !DILocation(line: 298, column: 50, scope: !2030)
!2036 = !DILocation(line: 298, column: 48, scope: !2030)
!2037 = !DILocation(line: 298, column: 8, scope: !2020)
!2038 = !DILocation(line: 299, column: 7, scope: !2030)
!2039 = !DILocation(line: 301, column: 8, scope: !2040)
!2040 = distinct !DILexicalBlock(scope: !2020, file: !3, line: 301, column: 8)
!2041 = !DILocation(line: 301, column: 15, scope: !2040)
!2042 = !DILocation(line: 301, column: 24, scope: !2040)
!2043 = !DILocation(line: 302, column: 10, scope: !2040)
!2044 = !DILocation(line: 302, column: 36, scope: !2040)
!2045 = !DILocation(line: 302, column: 14, scope: !2040)
!2046 = !DILocation(line: 302, column: 21, scope: !2040)
!2047 = !DILocation(line: 302, column: 33, scope: !2040)
!2048 = !DILocation(line: 302, column: 44, scope: !2040)
!2049 = !DILocation(line: 302, column: 51, scope: !2040)
!2050 = !DILocation(line: 302, column: 60, scope: !2040)
!2051 = !DILocation(line: 302, column: 42, scope: !2040)
!2052 = !DILocation(line: 301, column: 8, scope: !2020)
!2053 = !DILocation(line: 304, column: 7, scope: !2054)
!2054 = distinct !DILexicalBlock(scope: !2040, file: !3, line: 303, column: 4)
!2055 = !DILocation(line: 307, column: 11, scope: !2020)
!2056 = !DILocation(line: 307, column: 18, scope: !2020)
!2057 = !DILocation(line: 307, column: 27, scope: !2020)
!2058 = !DILocation(line: 307, column: 38, scope: !2020)
!2059 = !DILocation(line: 307, column: 44, scope: !2020)
!2060 = !DILocation(line: 307, column: 50, scope: !2020)
!2061 = !DILocation(line: 307, column: 57, scope: !2020)
!2062 = !DILocation(line: 307, column: 66, scope: !2020)
!2063 = !DILocation(line: 307, column: 4, scope: !2020)
!2064 = !DILocation(line: 308, column: 1, scope: !2020)
