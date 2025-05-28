Ù
VC:\Users\msi bravo\Desktop\FoodOrderingSystem\WalletService\Services\IWalletService.cs
	namespace 	
WalletService
 
. 
Services  
{ 
public 

	interface 
IWalletService #
{		 
Task

 
<

 
IEnumerable

 
<

 
Wallet

 
>

  
>

  !
GetAllWalletsAsync

" 4
(

4 5
)

5 6
;

6 7
Task 
< 
Wallet 
> 
GetWalletByIdAsync '
(' (
Guid( ,
walletId- 5
)5 6
;6 7
Task 
< 
Wallet 
> "
GetWalletByUserIdAsync +
(+ ,
Guid, 0
userId1 7
)7 8
;8 9
Task 
< 
Wallet 
> 
CreateWalletAsync &
(& '
Wallet' -
wallet. 4
)4 5
;5 6
Task 
< 
bool 
> 
UpdateWalletAsync $
($ %
Wallet% +
wallet, 2
)2 3
;3 4
Task 
< 
bool 
> 
DeleteWalletAsync $
($ %
Guid% )
walletId* 2
)2 3
;3 4
Task 
< 
bool 
> 
UpdateBalanceAsync %
(% &
Guid& *
userId+ 1
,1 2
decimal3 :
amount; A
,A B
boolC G
isCreditH P
)P Q
;Q R
Task 
< 
decimal 
? 
> 
GetBalanceAsync &
(& '
Guid' +
userId, 2
)2 3
;3 4
} 
} Û
]C:\Users\msi bravo\Desktop\FoodOrderingSystem\WalletService\Repositories\IWalletRepository.cs
	namespace 	
WalletService
 
. 
Repositories $
{ 
public 

	interface 
IWalletRepository &
{		 
Task

 
<

 
IEnumerable

 
<

 
Wallet

 
>

  
>

  !
GetAllWalletsAsync

" 4
(

4 5
)

5 6
;

6 7
Task 
< 
Wallet 
> 
GetWalletByIdAsync '
(' (
Guid( ,
walletId- 5
)5 6
;6 7
Task 
< 
Wallet 
> "
GetWalletByUserIdAsync +
(+ ,
Guid, 0
userId1 7
)7 8
;8 9
Task 
< 
Wallet 
> 
CreateWalletAsync &
(& '
Wallet' -
wallet. 4
)4 5
;5 6
Task 
< 
bool 
> 
DeleteWalletAsync $
($ %
Guid% )
walletId* 2
)2 3
;3 4
Task 
< 
bool 
> 
CreditAsync 
( 
Guid #
userId$ *
,* +
decimal, 3
amount4 :
): ;
;; <
Task 
< 
bool 
> 

DebitAsync 
( 
Guid "
userId# )
,) *
decimal+ 2
amount3 9
)9 :
;: ;
Task 
< 
decimal 
? 
> 
GetBalanceAsync &
(& '
Guid' +
userId, 2
)2 3
;3 4
} 
} Ë%
UC:\Users\msi bravo\Desktop\FoodOrderingSystem\WalletService\Services\WalletService.cs
	namespace 	
WalletService
 
. 
Services  
{ 
public		 

class		 
WalletService		 
:		  
IWalletService		! /
{

 
private 
readonly 
IWalletRepository *
_walletRepository+ <
;< =
public 
WalletService 
( 
IWalletRepository .
walletRepository/ ?
)? @
{ 	
_walletRepository 
= 
walletRepository  0
;0 1
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Wallet& ,
>, -
>- .
GetAllWalletsAsync/ A
(A B
)B C
{ 	
return 
await 
_walletRepository *
.* +
GetAllWalletsAsync+ =
(= >
)> ?
;? @
} 	
public 
async 
Task 
< 
Wallet  
>  !
GetWalletByIdAsync" 4
(4 5
Guid5 9
walletId: B
)B C
{ 	
return 
await 
_walletRepository *
.* +
GetWalletByIdAsync+ =
(= >
walletId> F
)F G
;G H
} 	
public 
async 
Task 
< 
Wallet  
>  !"
GetWalletByUserIdAsync" 8
(8 9
Guid9 =
userId> D
)D E
{ 	
return 
await 
_walletRepository *
.* +"
GetWalletByUserIdAsync+ A
(A B
userIdB H
)H I
;I J
} 	
public!! 
async!! 
Task!! 
<!! 
Wallet!!  
>!!  !
CreateWalletAsync!!" 3
(!!3 4
Wallet!!4 :
wallet!!; A
)!!A B
{"" 	
return$$ 
await$$ 
_walletRepository$$ *
.$$* +
CreateWalletAsync$$+ <
($$< =
wallet$$= C
)$$C D
;$$D E
}%% 	
public'' 
async'' 
Task'' 
<'' 
bool'' 
>'' 
UpdateWalletAsync''  1
(''1 2
Wallet''2 8
wallet''9 ?
)''? @
{(( 	
return** 
await** 
_walletRepository** *
.*** +
DeleteWalletAsync**+ <
(**< =
wallet**= C
.**C D
WalletId**D L
)**L M
&&**N P
(++ 
await++ 
_walletRepository++ +
.+++ ,
CreateWalletAsync++, =
(++= >
wallet++> D
)++D E
!=++F H
null++I M
)++M N
;++N O
},, 	
public.. 
async.. 
Task.. 
<.. 
bool.. 
>.. 
DeleteWalletAsync..  1
(..1 2
Guid..2 6
walletId..7 ?
)..? @
{// 	
return00 
await00 
_walletRepository00 *
.00* +
DeleteWalletAsync00+ <
(00< =
walletId00= E
)00E F
;00F G
}11 	
public33 
async33 
Task33 
<33 
bool33 
>33 
UpdateBalanceAsync33  2
(332 3
Guid333 7
userId338 >
,33> ?
decimal33@ G
amount33H N
,33N O
bool33P T
isCredit33U ]
)33] ^
{44 	
if55 
(55 
isCredit55 
)55 
{66 
return77 
await77 
_walletRepository77 .
.77. /
CreditAsync77/ :
(77: ;
userId77; A
,77A B
amount77C I
)77I J
;77J K
}88 
else99 
{:: 
return;; 
await;; 
_walletRepository;; .
.;;. /

DebitAsync;;/ 9
(;;9 :
userId;;: @
,;;@ A
amount;;B H
);;H I
;;;I J
}<< 
}== 	
public?? 
async?? 
Task?? 
<?? 
decimal?? !
???! "
>??" #
GetBalanceAsync??$ 3
(??3 4
Guid??4 8
userId??9 ?
)??? @
{@@ 	
returnAA 
awaitAA 
_walletRepositoryAA *
.AA* +
GetBalanceAsyncAA+ :
(AA: ;
userIdAA; A
)AAA B
;AAB C
}BB 	
}CC 
}DD Î8
\C:\Users\msi bravo\Desktop\FoodOrderingSystem\WalletService\Repositories\WalletRepository.cs
	namespace		 	
WalletService		
 
.		 
Repositories		 $
{

 
public 

class 
WalletRepository !
:" #
IWalletRepository$ 5
{ 
private 
readonly 
WalletDbContext (
_context) 1
;1 2
public 
WalletRepository 
(  
WalletDbContext  /
context0 7
)7 8
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Wallet& ,
>, -
>- .
GetAllWalletsAsync/ A
(A B
)B C
{ 	
return 
await 
_context !
.! "
Wallets" )
.) *
ToListAsync* 5
(5 6
)6 7
;7 8
} 	
public 
async 
Task 
< 
Wallet  
>  !
GetWalletByIdAsync" 4
(4 5
Guid5 9
walletId: B
)B C
{ 	
return 
await 
_context !
.! "
Wallets" )
.! "
FirstOrDefaultAsync" 5
(5 6
w6 7
=>8 :
w; <
.< =
WalletId= E
==F H
walletIdI Q
)Q R
;R S
} 	
public 
async 
Task 
< 
Wallet  
>  !"
GetWalletByUserIdAsync" 8
(8 9
Guid9 =
userId> D
)D E
{   	
return!! 
await!! 
_context!! !
.!!! "
Wallets!!" )
.""! "
FirstOrDefaultAsync""" 5
(""5 6
w""6 7
=>""8 :
w""; <
.""< =
UserId""= C
==""D F
userId""G M
)""M N
;""N O
}## 	
public%% 
async%% 
Task%% 
<%% 
Wallet%%  
>%%  !
CreateWalletAsync%%" 3
(%%3 4
Wallet%%4 :
wallet%%; A
)%%A B
{&& 	
await'' 
_context'' 
.'' 
Wallets'' "
.''" #
AddAsync''# +
(''+ ,
wallet'', 2
)''2 3
;''3 4
await(( 
_context(( 
.(( 
SaveChangesAsync(( +
(((+ ,
)((, -
;((- .
return)) 
wallet)) 
;)) 
}** 	
public,, 
async,, 
Task,, 
<,, 
bool,, 
>,, 
DeleteWalletAsync,,  1
(,,1 2
Guid,,2 6
walletId,,7 ?
),,? @
{-- 	
var.. 
wallet.. 
=.. 
await.. 
_context.. '
...' (
Wallets..( /
.//' (
FirstOrDefaultAsync//( ;
(//; <
w//< =
=>//> @
w//A B
.//B C
WalletId//C K
==//L N
walletId//O W
)//W X
;//X Y
if00 
(00 
wallet00 
==00 
null00 
)00 
return00  &
false00' ,
;00, -
_context22 
.22 
Wallets22 
.22 
Remove22 #
(22# $
wallet22$ *
)22* +
;22+ ,
await33 
_context33 
.33 
SaveChangesAsync33 +
(33+ ,
)33, -
;33- .
return44 
true44 
;44 
}55 	
public77 
async77 
Task77 
<77 
bool77 
>77 
CreditAsync77  +
(77+ ,
Guid77, 0
userId771 7
,777 8
decimal779 @
amount77A G
)77G H
{88 	
var99 
wallet99 
=99 
await99 
_context99 '
.99' (
Wallets99( /
.::' (
FirstOrDefaultAsync::( ;
(::; <
w::< =
=>::> @
w::A B
.::B C
UserId::C I
==::J L
userId::M S
)::S T
;::T U
if;; 
(;; 
wallet;; 
==;; 
null;; 
||;; !
amount;;" (
<=;;) +
$num;;, -
);;- .
return;;/ 5
false;;6 ;
;;;; <
wallet== 
.== 
Balance== 
+=== 
amount== $
;==$ %
wallet>> 
.>> 
	UpdatedAt>> 
=>> 
DateTime>> '
.>>' (
UtcNow>>( .
;>>. /
await?? 
_context?? 
.?? 
SaveChangesAsync?? +
(??+ ,
)??, -
;??- .
return@@ 
true@@ 
;@@ 
}AA 	
publicCC 
asyncCC 
TaskCC 
<CC 
boolCC 
>CC 

DebitAsyncCC  *
(CC* +
GuidCC+ /
userIdCC0 6
,CC6 7
decimalCC8 ?
amountCC@ F
)CCF G
{DD 	
varEE 
walletEE 
=EE 
awaitEE 
_contextEE '
.EE' (
WalletsEE( /
.FF' (
FirstOrDefaultAsyncFF( ;
(FF; <
wFF< =
=>FF> @
wFFA B
.FFB C
UserIdFFC I
==FFJ L
userIdFFM S
)FFS T
;FFT U
ifGG 
(GG 
walletGG 
==GG 
nullGG 
||GG !
amountGG" (
<=GG) +
$numGG, -
||GG. 0
walletGG1 7
.GG7 8
BalanceGG8 ?
<GG@ A
amountGGB H
)GGH I
returnGGJ P
falseGGQ V
;GGV W
walletII 
.II 
BalanceII 
-=II 
amountII $
;II$ %
walletJJ 
.JJ 
	UpdatedAtJJ 
=JJ 
DateTimeJJ '
.JJ' (
UtcNowJJ( .
;JJ. /
awaitKK 
_contextKK 
.KK 
SaveChangesAsyncKK +
(KK+ ,
)KK, -
;KK- .
returnLL 
trueLL 
;LL 
}MM 	
publicOO 
asyncOO 
TaskOO 
<OO 
decimalOO !
?OO! "
>OO" #
GetBalanceAsyncOO$ 3
(OO3 4
GuidOO4 8
userIdOO9 ?
)OO? @
{PP 	
varQQ 
walletQQ 
=QQ 
awaitQQ 
_contextQQ '
.QQ' (
WalletsQQ( /
.RR' (
FirstOrDefaultAsyncRR( ;
(RR; <
wRR< =
=>RR> @
wRRA B
.RRB C
UserIdRRC I
==RRJ L
userIdRRM S
)RRS T
;RRT U
returnSS 
walletSS 
?SS 
.SS 
BalanceSS "
;SS" #
}TT 	
}UU 
}VV ∑A
FC:\Users\msi bravo\Desktop\FoodOrderingSystem\WalletService\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
WebHost 
. 
ConfigureKestrel  
(  !
options! (
=>) +
{ 
options 
. 
ListenAnyIP 
( 
$num 
) 
; 
} 
) 
; 
builder 
. 
Services 
. 
	Configure 
< 
JwtSettings &
>& '
(' (
builder( /
./ 0
Configuration0 =
.= >

GetSection> H
(H I
$strI V
)V W
)W X
;X Y
builder 
. 
Services 
. 
AddDbContext 
< 
WalletDbContext -
>- .
(. /
options/ 6
=>7 9
options 
. 
UseSqlServer 
( 
builder  
.  !
Configuration! .
.. /
GetConnectionString/ B
(B C
$strC V
)V W
,W X

sqlOptions 
=> 

sqlOptions  
.  ! 
EnableRetryOnFailure! 5
(5 6
)6 7
) 
) 
; 
builder 
. 
Services 
. 
	AddScoped 
< 
IWalletRepository ,
,, -
WalletRepository. >
>> ?
(? @
)@ A
;A B
builder 
. 
Services 
. 
	AddScoped 
< 
IWalletService )
,) *
WalletService+ 8
.8 9
Services9 A
.A B
WalletServiceB O
>O P
(P Q
)Q R
;R S
builder   
.   
Services   
.   
AddControllers   
(    
)    !
;  ! "
builder!! 
.!! 
Services!! 
.!! #
AddEndpointsApiExplorer!! (
(!!( )
)!!) *
;!!* +
builder$$ 
.$$ 
Services$$ 
.$$ 
AddSwaggerGen$$ 
($$ 
c$$  
=>$$! #
{%% 
c&& 
.&& 

SwaggerDoc&& 
(&& 
$str&& 
,&& 
new&& 
(&& 
)&& 
{&& 
Title&& $
=&&% &
$str&&' :
,&&: ;
Version&&< C
=&&D E
$str&&F J
}&&K L
)&&L M
;&&M N
var(( 
securityScheme(( 
=(( 
new(( !
OpenApiSecurityScheme(( 2
{)) 
Name** 
=** 
$str** 
,** 
Type++ 
=++ 
SecuritySchemeType++ !
.++! "
Http++" &
,++& '
Scheme,, 
=,, 
$str,, 
,,, 
BearerFormat-- 
=-- 
$str-- 
,-- 
In.. 

=.. 
ParameterLocation.. 
... 
Header.. %
,..% &
Description// 
=// 
$str// B
,//B C
	Reference00 
=00 
new00 
OpenApiReference00 (
{11 	
Type22 
=22 
ReferenceType22  
.22  !
SecurityScheme22! /
,22/ 0
Id33 
=33 
$str33 
}44 	
}55 
;55 
c77 
.77 !
AddSecurityDefinition77 
(77 
$str77 $
,77$ %
securityScheme77& 4
)774 5
;775 6
c88 
.88 "
AddSecurityRequirement88 
(88 
new88  &
OpenApiSecurityRequirement88! ;
{99 
{:: 	
securityScheme::
 
,:: 
new:: 
[:: 
]:: 
{::  !
$str::" *
}::+ ,
}::- .
};; 
);; 
;;; 
}<< 
)<< 
;<< 
builder?? 
.?? 
Services?? 
.?? 
AddAuthentication?? "
(??" #
options??# *
=>??+ -
{@@ 
optionsAA 
.AA %
DefaultAuthenticateSchemeAA %
=AA& '
JwtBearerDefaultsAA( 9
.AA9 : 
AuthenticationSchemeAA: N
;AAN O
optionsBB 
.BB "
DefaultChallengeSchemeBB "
=BB# $
JwtBearerDefaultsBB% 6
.BB6 7 
AuthenticationSchemeBB7 K
;BBK L
}CC 
)CC 
.DD 
AddJwtBearerDD 
(DD 
optionsDD 
=>DD 
{EE 
varFF 
jwtSettingsFF 
=FF 
builderFF 
.FF 
ConfigurationFF +
.FF+ ,

GetSectionFF, 6
(FF6 7
$strFF7 D
)FFD E
.FFE F
GetFFF I
<FFI J
JwtSettingsFFJ U
>FFU V
(FFV W
)FFW X
;FFX Y
optionsGG 
.GG %
TokenValidationParametersGG %
=GG& '
newGG( +%
TokenValidationParametersGG, E
{HH 
ValidateIssuerII 
=II 
trueII 
,II 
ValidateAudienceJJ 
=JJ 
trueJJ 
,JJ  
ValidateLifetimeKK 
=KK 
trueKK 
,KK  $
ValidateIssuerSigningKeyLL  
=LL! "
trueLL# '
,LL' (
ValidIssuerMM 
=MM 
jwtSettingsMM !
.MM! "
IssuerMM" (
,MM( )
ValidAudienceNN 
=NN 
jwtSettingsNN #
.NN# $
AudienceNN$ ,
,NN, -
IssuerSigningKeyOO 
=OO 
newOO  
SymmetricSecurityKeyOO 3
(OO3 4
EncodingOO4 <
.OO< =
UTF8OO= A
.OOA B
GetBytesOOB J
(OOJ K
jwtSettingsOOK V
.OOV W
KeyOOW Z
)OOZ [
)OO[ \
}PP 
;PP 
}QQ 
)QQ 
;QQ 
builderSS 
.SS 
ServicesSS 
.SS 
AddAuthorizationSS !
(SS! "
)SS" #
;SS# $
varUU 
appUU 
=UU 	
builderUU
 
.UU 
BuildUU 
(UU 
)UU 
;UU 
appWW 
.WW 

UseRoutingWW 
(WW 
)WW 
;WW 
appYY 
.YY 
UseAuthenticationYY 
(YY 
)YY 
;YY 
appZZ 
.ZZ 
UseAuthorizationZZ 
(ZZ 
)ZZ 
;ZZ 
app\\ 
.\\ 

UseSwagger\\ 
(\\ 
)\\ 
;\\ 
app]] 
.]] 
UseSwaggerUI]] 
(]] 
)]] 
;]] 
app__ 
.__ 
UseEndpoints__ 
(__ 
	endpoints__ 
=>__ 
{`` 
	endpointsaa 
.aa 
MapControllersaa 
(aa 
)aa 
;aa 
}bb 
)bb 
;bb 
usingee 
(ee 
varee 

scopeee 
=ee 
appee 
.ee 
Servicesee 
.ee  
CreateScopeee  +
(ee+ ,
)ee, -
)ee- .
{ff 
vargg 
	dbContextgg 
=gg 
scopegg 
.gg 
ServiceProvidergg )
.gg) *
GetRequiredServicegg* <
<gg< =
WalletDbContextgg= L
>ggL M
(ggM N
)ggN O
;ggO P
	dbContexthh 
.hh 
Databasehh 
.hh 
Migratehh 
(hh 
)hh  
;hh  !
}ii 
appkk 
.kk 
Runkk 
(kk 
)kk 	
;kk	 
é
LC:\Users\msi bravo\Desktop\FoodOrderingSystem\WalletService\Models\Wallet.cs
	namespace 	
WalletService
 
. 
Models 
{ 
public 

class 
Wallet 
{ 
[ 	
Key	 
] 
public		 
Guid		 
WalletId		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
[ 	
Required	 
] 
public 
Guid 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
[ 	
Range	 
( 
$num 
, 
double 
. 
MaxValue !
)! "
]" #
public 
decimal 
Balance 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
DateTime2 :
.: ;
UtcNow; A
;A B
public 
DateTime 
	UpdatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
DateTime2 :
.: ;
UtcNow; A
;A B
} 
} Ö	
QC:\Users\msi bravo\Desktop\FoodOrderingSystem\WalletService\Models\JwtSettings.cs
	namespace 	
WalletService
 
. 
Models 
{ 
public 

class 
JwtSettings 
{ 
public 
string 
Key 
{ 
get 
;  
set! $
;$ %
}& '
=( )
string* 0
.0 1
Empty1 6
;6 7
public 
string 
Issuer 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
string- 3
.3 4
Empty4 9
;9 :
public 
string 
Audience 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public 
int 
ExpiryMinutes  
{! "
get# &
;& '
set( +
;+ ,
}- .
}		 
}

 é
kC:\Users\msi bravo\Desktop\FoodOrderingSystem\WalletService\Migrations\20250424123111_UpdateWalletModel2.cs
	namespace 	
WalletService
 
. 

Migrations "
{ 
public 

partial 
class 
UpdateWalletModel2 +
:, -
	Migration. 7
{		 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
} 	
} 
} £
jC:\Users\msi bravo\Desktop\FoodOrderingSystem\WalletService\Migrations\20250424120848_UpdateWalletModel.cs
	namespace 	
WalletService
 
. 

Migrations "
{ 
public		 

partial		 
class		 
UpdateWalletModel		 *
:		+ ,
	Migration		- 6
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str 
,  
columns 
: 
table 
=> !
new" %
{ 
WalletId 
= 
table $
.$ %
Column% +
<+ ,
Guid, 0
>0 1
(1 2
type2 6
:6 7
$str8 J
,J K
nullableL T
:T U
falseV [
)[ \
,\ ]
UserId 
= 
table "
." #
Column# )
<) *
Guid* .
>. /
(/ 0
type0 4
:4 5
$str6 H
,H I
nullableJ R
:R S
falseT Y
)Y Z
,Z [
Balance 
= 
table #
.# $
Column$ *
<* +
decimal+ 2
>2 3
(3 4
type4 8
:8 9
$str: I
,I J
nullableK S
:S T
falseU Z
)Z [
,[ \
	CreatedAt 
= 
table  %
.% &
Column& ,
<, -
DateTime- 5
>5 6
(6 7
type7 ;
:; <
$str= H
,H I
nullableJ R
:R S
falseT Y
)Y Z
,Z [
	UpdatedAt 
= 
table  %
.% &
Column& ,
<, -
DateTime- 5
>5 6
(6 7
type7 ;
:; <
$str= H
,H I
nullableJ R
:R S
falseT Y
)Y Z
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 1
,1 2
x3 4
=>5 7
x8 9
.9 :
WalletId: B
)B C
;C D
} 
) 
; 
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{   	
migrationBuilder!! 
.!! 
	DropTable!! &
(!!& '
name"" 
:"" 
$str"" 
)""  
;""  !
}## 	
}$$ 
}%% Ú
]C:\Users\msi bravo\Desktop\FoodOrderingSystem\WalletService\Migrations\20250423092226_Init.cs
	namespace 	
WalletService
 
. 

Migrations "
{ 
public 

partial 
class 
Init 
: 
	Migration  )
{		 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
} 	
} 
} ‡
SC:\Users\msi bravo\Desktop\FoodOrderingSystem\WalletService\Data\WalletDbContext.cs
	namespace 	
WalletService
 
. 
Data 
{ 
public 

class 
WalletDbContext  
:! "
	DbContext# ,
{ 
public 
WalletDbContext 
( 
DbContextOptions /
</ 0
WalletDbContext0 ?
>? @
optionsA H
)H I
:		 
base		 
(		 
options		 
)		 
{		 
}		 
public 
DbSet 
< 
Wallet 
> 
Wallets $
{% &
get' *
;* +
set, /
;/ 0
}1 2
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
base 
. 
OnModelCreating  
(  !
modelBuilder! -
)- .
;. /
modelBuilder 
. 
Entity 
<  
Wallet  &
>& '
(' (
w( )
=>* ,
{ 
w 
. 
HasKey 
( 
wallet 
=> 
wallet %
.% &
WalletId& .
). /
;/ 0
w 
. 
Property 
( 
wallet 
=>  
wallet! '
.' (
Balance( /
)/ 0
.0 1
HasPrecision1 =
(= >
$num> @
,@ A
$numB C
)C D
;D E
} 
) 
; 
} 
} 
} ç?
[C:\Users\msi bravo\Desktop\FoodOrderingSystem\WalletService\Controllers\WalletController.cs
	namespace 	
WalletService
 
. 
Controllers #
{		 
[

 
ApiController

 
]

 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
WalletController !
:" #
ControllerBase$ 2
{ 
private 
readonly 
IWalletService '
_walletService( 6
;6 7
public 
WalletController 
(  
IWalletService  .
walletService/ <
)< =
{ 	
_walletService 
= 
walletService *
;* +
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetAll) /
(/ 0
)0 1
{ 	
var 
wallets 
= 
await 
_walletService  .
.. /
GetAllWalletsAsync/ A
(A B
)B C
;C D
return 
Ok 
( 
wallets 
) 
; 
} 	
[ 	
HttpGet	 
( 
$str "
)" #
]# $
public 
async 
Task 
< 
IActionResult '
>' (
GetById) 0
(0 1
Guid1 5
walletId6 >
)> ?
{ 	
var 
wallet 
= 
await 
_walletService -
.- .
GetWalletByIdAsync. @
(@ A
walletIdA I
)I J
;J K
if   
(   
wallet   
==   
null   
)   
return    &
NotFound  ' /
(  / 0
)  0 1
;  1 2
return!! 
Ok!! 
(!! 
wallet!! 
)!! 
;!! 
}"" 	
[$$ 	
HttpGet$$	 
($$ 
$str$$ %
)$$% &
]$$& '
public%% 
async%% 
Task%% 
<%% 
IActionResult%% '
>%%' (
GetByUserId%%) 4
(%%4 5
Guid%%5 9
userId%%: @
)%%@ A
{&& 	
var'' 
wallet'' 
='' 
await'' 
_walletService'' -
.''- ."
GetWalletByUserIdAsync''. D
(''D E
userId''E K
)''K L
;''L M
if(( 
((( 
wallet(( 
==(( 
null(( 
)(( 
return((  &
NotFound((' /
(((/ 0
)((0 1
;((1 2
return)) 
Ok)) 
()) 
wallet)) 
))) 
;)) 
}** 	
[,, 	
HttpPost,,	 
],, 
public-- 
async-- 
Task-- 
<-- 
IActionResult-- '
>--' (
Create--) /
(--/ 0
[--0 1
FromBody--1 9
]--9 :
Wallet--; A
wallet--B H
)--H I
{.. 	
if// 
(// 
!// 

ModelState// 
.// 
IsValid// #
)//# $
return//% +

BadRequest//, 6
(//6 7

ModelState//7 A
)//A B
;//B C
var00 
createdWallet00 
=00 
await00  %
_walletService00& 4
.004 5
CreateWalletAsync005 F
(00F G
wallet00G M
)00M N
;00N O
return11 
CreatedAtAction11 "
(11" #
nameof11# )
(11) *
GetById11* 1
)111 2
,112 3
new114 7
{118 9
walletId11: B
=11C D
createdWallet11E R
.11R S
WalletId11S [
}11\ ]
,11] ^
createdWallet11_ l
)11l m
;11m n
}22 	
[44 	

HttpDelete44	 
(44 
$str44 %
)44% &
]44& '
public55 
async55 
Task55 
<55 
IActionResult55 '
>55' (
Delete55) /
(55/ 0
Guid550 4
walletId555 =
)55= >
{66 	
var77 
success77 
=77 
await77 
_walletService77  .
.77. /
DeleteWalletAsync77/ @
(77@ A
walletId77A I
)77I J
;77J K
if88 
(88 
!88 
success88 
)88 
return88  
NotFound88! )
(88) *
)88* +
;88+ ,
return99 
	NoContent99 
(99 
)99 
;99 
}:: 	
[<< 	
HttpPost<<	 
(<< 
$str<< 
)<< 
]<< 
public== 
async== 
Task== 
<== 
IActionResult== '
>==' (
Credit==) /
(==/ 0
[==0 1
	FromQuery==1 :
]==: ;
Guid==< @
userId==A G
,==G H
[==I J
	FromQuery==J S
]==S T
decimal==U \
amount==] c
)==c d
{>> 	
var?? 
success?? 
=?? 
await?? 
_walletService??  .
.??. /
UpdateBalanceAsync??/ A
(??A B
userId??B H
,??H I
amount??J P
,??P Q
isCredit??R Z
:??Z [
true??\ `
)??` a
;??a b
if@@ 
(@@ 
!@@ 
success@@ 
)@@ 
return@@  

BadRequest@@! +
(@@+ ,
$str@@, F
)@@F G
;@@G H
returnAA 
OkAA 
(AA 
$strAA 5
)AA5 6
;AA6 7
}BB 	
[DD 	
HttpPostDD	 
(DD 
$strDD 
)DD 
]DD 
publicEE 
asyncEE 
TaskEE 
<EE 
IActionResultEE '
>EE' (
DebitEE) .
(EE. /
[EE/ 0
	FromQueryEE0 9
]EE9 :
GuidEE; ?
userIdEE@ F
,EEF G
[EEH I
	FromQueryEEI R
]EER S
decimalEET [
amountEE\ b
)EEb c
{FF 	
varGG 
successGG 
=GG 
awaitGG 
_walletServiceGG  .
.GG. /
UpdateBalanceAsyncGG/ A
(GGA B
userIdGGB H
,GGH I
amountGGJ P
,GGP Q
isCreditGGR Z
:GGZ [
falseGG\ a
)GGa b
;GGb c
ifHH 
(HH 
!HH 
successHH 
)HH 
returnHH  

BadRequestHH! +
(HH+ ,
$strHH, T
)HHT U
;HHU V
returnII 
OkII 
(II 
$strII 4
)II4 5
;II5 6
}JJ 	
[LL 	
HttpGetLL	 
(LL 
$strLL (
)LL( )
]LL) *
publicMM 
asyncMM 
TaskMM 
<MM 
IActionResultMM '
>MM' (

GetBalanceMM) 3
(MM3 4
GuidMM4 8
userIdMM9 ?
)MM? @
{NN 	
varOO 
balanceOO 
=OO 
awaitOO 
_walletServiceOO  .
.OO. /
GetBalanceAsyncOO/ >
(OO> ?
userIdOO? E
)OOE F
;OOF G
ifPP 
(PP 
balancePP 
==PP 
nullPP 
)PP  
returnPP! '
NotFoundPP( 0
(PP0 1
)PP1 2
;PP2 3
returnQQ 
OkQQ 
(QQ 
balanceQQ 
)QQ 
;QQ 
}RR 	
}SS 
}TT 