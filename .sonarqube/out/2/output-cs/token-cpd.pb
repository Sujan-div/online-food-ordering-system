⁄
]C:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Services\RestaurantService.cs
	namespace 	
RestaurantService
 
. 
Services $
{ 
public 

class 
RestaurantService "
:# $
IRestaurantService% 7
{		 
private

 
readonly

 !
IRestaurantRepository

 .
_repository

/ :
;

: ;
public 
RestaurantService  
(  !!
IRestaurantRepository! 6

repository7 A
)A B
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
IEnumerable %
<% &

Restaurant& 0
>0 1
>1 2"
GetAllRestaurantsAsync3 I
(I J
)J K
{ 	
return 
await 
_repository $
.$ %
GetAllAsync% 0
(0 1
)1 2
;2 3
} 	
public 
async 
Task 
< 

Restaurant $
>$ %"
GetRestaurantByIdAsync& <
(< =
Guid= A
idB D
)D E
{ 	
return 
await 
_repository $
.$ %
GetByIdAsync% 1
(1 2
id2 4
)4 5
;5 6
} 	
public 
async 
Task 
< 

Restaurant $
>$ %!
CreateRestaurantAsync& ;
(; <

Restaurant< F

restaurantG Q
)Q R
{ 	
return 
await 
_repository $
.$ %
AddAsync% -
(- .

restaurant. 8
)8 9
;9 :
} 	
public   
async   
Task   !
UpdateRestaurantAsync   /
(  / 0

Restaurant  0 :

restaurant  ; E
)  E F
{!! 	
await"" 
_repository"" 
."" 
UpdateAsync"" )
("") *

restaurant""* 4
)""4 5
;""5 6
}## 	
public%% 
async%% 
Task%% !
DeleteRestaurantAsync%% /
(%%/ 0
Guid%%0 4
id%%5 7
)%%7 8
{&& 	
await'' 
_repository'' 
.'' 
DeleteAsync'' )
('') *
id''* ,
)'', -
;''- .
}(( 	
})) 
}** •	
^C:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Services\IRestaurantService.cs
	namespace 	
RestaurantService
 
. 
Services $
{ 
public 

	interface 
IRestaurantService '
{ 
Task		 
<		 
IEnumerable		 
<		 

Restaurant		 #
>		# $
>		$ %"
GetAllRestaurantsAsync		& <
(		< =
)		= >
;		> ?
Task

 
<

 

Restaurant

 
>

 "
GetRestaurantByIdAsync

 /
(

/ 0
Guid

0 4
id

5 7
)

7 8
;

8 9
Task 
< 

Restaurant 
> !
CreateRestaurantAsync .
(. /

Restaurant/ 9

restaurant: D
)D E
;E F
Task !
UpdateRestaurantAsync "
(" #

Restaurant# -

restaurant. 8
)8 9
;9 :
Task !
DeleteRestaurantAsync "
(" #
Guid# '
id( *
)* +
;+ ,
} 
} Ü
dC:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Repositories\RestaurantRepository.cs
	namespace 	
RestaurantService
 
. 
Repositories (
{ 
public		 

class		  
RestaurantRepository		 %
:		& '!
IRestaurantRepository		( =
{

 
private 
readonly 
RestaurantDbContext ,
_context- 5
;5 6
public  
RestaurantRepository #
(# $
RestaurantDbContext$ 7
context8 ?
)? @
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &

Restaurant& 0
>0 1
>1 2
GetAllAsync3 >
(> ?
)? @
{ 	
return 
await 
_context !
.! "
Restaurants" -
.- .
ToListAsync. 9
(9 :
): ;
;; <
} 	
public 
async 
Task 
< 

Restaurant $
>$ %
GetByIdAsync& 2
(2 3
Guid3 7
id8 :
): ;
{ 	
return 
await 
_context !
.! "
Restaurants" -
.- .
	FindAsync. 7
(7 8
id8 :
): ;
;; <
} 	
public 
async 
Task 
< 

Restaurant $
>$ %
AddAsync& .
(. /

Restaurant/ 9

restaurant: D
)D E
{ 	
_context 
. 
Restaurants  
.  !
Add! $
($ %

restaurant% /
)/ 0
;0 1
await 
_context 
. 
SaveChangesAsync +
(+ ,
), -
;- .
return   

restaurant   
;   
}!! 	
public## 
async## 
Task## 
UpdateAsync## %
(##% &

Restaurant##& 0

restaurant##1 ;
)##; <
{$$ 	
_context%% 
.%% 
Entry%% 
(%% 

restaurant%% %
)%%% &
.%%& '
State%%' ,
=%%- .
EntityState%%/ :
.%%: ;
Modified%%; C
;%%C D
await&& 
_context&& 
.&& 
SaveChangesAsync&& +
(&&+ ,
)&&, -
;&&- .
}'' 	
public)) 
async)) 
Task)) 
DeleteAsync)) %
())% &
Guid))& *
id))+ -
)))- .
{** 	
var++ 

restaurant++ 
=++ 
await++ "
_context++# +
.+++ ,
Restaurants++, 7
.++7 8
	FindAsync++8 A
(++A B
id++B D
)++D E
;++E F
if,, 
(,, 

restaurant,, 
!=,, 
null,, "
),," #
{-- 
_context.. 
... 
Restaurants.. $
...$ %
Remove..% +
(..+ ,

restaurant.., 6
)..6 7
;..7 8
await// 
_context// 
.// 
SaveChangesAsync// /
(/// 0
)//0 1
;//1 2
}00 
}11 	
}22 
}33 ˝
eC:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Repositories\IRestaurantRepository.cs
	namespace 	
RestaurantService
 
. 
Repositories (
{ 
public 

	interface !
IRestaurantRepository *
{ 
Task		 
<		 
IEnumerable		 
<		 

Restaurant		 #
>		# $
>		$ %
GetAllAsync		& 1
(		1 2
)		2 3
;		3 4
Task

 
<

 

Restaurant

 
>

 
GetByIdAsync

 %
(

% &
Guid

& *
id

+ -
)

- .
;

. /
Task 
< 

Restaurant 
> 
AddAsync !
(! "

Restaurant" ,

restaurant- 7
)7 8
;8 9
Task 
UpdateAsync 
( 

Restaurant #

restaurant$ .
). /
;/ 0
Task 
DeleteAsync 
( 
Guid 
id  
)  !
;! "
} 
} ’@
JC:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
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
builder 
. 
Services 
. 
AddDbContext 
< 
RestaurantDbContext 1
>1 2
(2 3
options3 :
=>; =
options 
. 
UseSqlServer 
( 
builder  
.  !
Configuration! .
.. /
GetConnectionString/ B
(B C
$strC V
)V W
,W X

sqlOptions 
=> 

sqlOptions  
.  ! 
EnableRetryOnFailure! 5
(5 6
)6 7
) 
) 
; 
builder 
. 
Services 
. 
	AddScoped 
< 
IRestaurantService -
,- .
RestaurantService/ @
.@ A
ServicesA I
.I J
RestaurantServiceJ [
>[ \
(\ ]
)] ^
;^ _
builder 
. 
Services 
. 
	AddScoped 
< !
IRestaurantRepository 0
,0 1
RestaurantService2 C
.C D
RepositoriesD P
.P Q 
RestaurantRepositoryQ e
>e f
(f g
)g h
;h i
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder   
.   
Services   
.   
AddSwaggerGen   
(   
c    
=>  ! #
{!! 
c"" 
."" 

SwaggerDoc"" 
("" 
$str"" 
,"" 
new"" 
("" 
)"" 
{"" 
Title"" $
=""% &
$str""' >
,""> ?
Version""@ G
=""H I
$str""J N
}""O P
)""P Q
;""Q R
var$$ 
securityScheme$$ 
=$$ 
new$$ !
OpenApiSecurityScheme$$ 2
{%% 
Name&& 
=&& 
$str&& 
,&& 
Type'' 
='' 
SecuritySchemeType'' !
.''! "
Http''" &
,''& '
Scheme(( 
=(( 
$str(( 
,(( 
BearerFormat)) 
=)) 
$str)) 
,)) 
In** 

=** 
ParameterLocation** 
.** 
Header** %
,**% &
Description++ 
=++ 
$str++ M
,++M N
	Reference,, 
=,, 
new,, 
OpenApiReference,, (
{-- 	
Type.. 
=.. 
ReferenceType..  
...  !
SecurityScheme..! /
,../ 0
Id// 
=// 
$str// 
}00 	
}11 
;11 
c33 
.33 !
AddSecurityDefinition33 
(33 
$str33 $
,33$ %
securityScheme33& 4
)334 5
;335 6
var55 
securityRequirement55 
=55 
new55 !&
OpenApiSecurityRequirement55" <
{66 
{77 	
securityScheme77
 
,77 
new77 
[77 
]77 
{77  !
$str77" *
}77+ ,
}77- .
}88 
;88 
c:: 
.:: "
AddSecurityRequirement:: 
(:: 
securityRequirement:: 0
)::0 1
;::1 2
};; 
);; 
;;; 
builder<< 
.<< 
Services<< 
.<< 
AddAuthentication<< "
(<<" #
options<<# *
=><<+ -
{== 
options>> 
.>> %
DefaultAuthenticateScheme>> %
=>>& '
JwtBearerDefaults>>( 9
.>>9 : 
AuthenticationScheme>>: N
;>>N O
options?? 
.?? "
DefaultChallengeScheme?? "
=??# $
JwtBearerDefaults??% 6
.??6 7 
AuthenticationScheme??7 K
;??K L
}@@ 
)@@ 
.AA 
AddJwtBearerAA 
(AA 
optionsAA 
=>AA 
{BB 
varCC 
jwtSettingsCC 
=CC 
builderCC 
.CC 
ConfigurationCC +
.CC+ ,

GetSectionCC, 6
(CC6 7
$strCC7 D
)CCD E
.CCE F
GetCCF I
<CCI J
JwtSettingsCCJ U
>CCU V
(CCV W
)CCW X
;CCX Y
optionsDD 
.DD %
TokenValidationParametersDD %
=DD& '
newDD( +%
TokenValidationParametersDD, E
{EE 
ValidateIssuerFF 
=FF 
trueFF 
,FF 
ValidateAudienceGG 
=GG 
trueGG 
,GG  
ValidateLifetimeHH 
=HH 
trueHH 
,HH  $
ValidateIssuerSigningKeyII  
=II! "
trueII# '
,II' (
ValidIssuerJJ 
=JJ 
jwtSettingsJJ !
.JJ! "
IssuerJJ" (
,JJ( )
ValidAudienceKK 
=KK 
jwtSettingsKK #
.KK# $
AudienceKK$ ,
,KK, -
IssuerSigningKeyLL 
=LL 
newLL  
SymmetricSecurityKeyLL 3
(LL3 4
EncodingLL4 <
.LL< =
UTF8LL= A
.LLA B
GetBytesLLB J
(LLJ K
jwtSettingsLLK V
.LLV W
KeyLLW Z
)LLZ [
)LL[ \
}MM 
;MM 
}NN 
)NN 
;NN 
builderPP 
.PP 
ServicesPP 
.PP 
AddAuthorizationPP !
(PP! "
)PP" #
;PP# $
varQQ 
appQQ 
=QQ 	
builderQQ
 
.QQ 
BuildQQ 
(QQ 
)QQ 
;QQ 
appTT 
.TT 

UseRoutingTT 
(TT 
)TT 
;TT 
appVV 
.VV 
UseAuthenticationVV 
(VV 
)VV 
;VV 
appWW 
.WW 
UseAuthorizationWW 
(WW 
)WW 
;WW 
appZZ 
.ZZ 

UseSwaggerZZ 
(ZZ 
)ZZ 
;ZZ 
app[[ 
.[[ 
UseSwaggerUI[[ 
([[ 
)[[ 
;[[ 
app]] 
.]] 
UseEndpoints]] 
(]] 
	endpoints]] 
=>]] 
{^^ 
	endpoints__ 
.__ 
MapControllers__ 
(__ 
)__ 
;__ 
}`` 
)`` 
;`` 
usingbb 
(bb 
varbb 

scopebb 
=bb 
appbb 
.bb 
Servicesbb 
.bb  
CreateScopebb  +
(bb+ ,
)bb, -
)bb- .
{cc 
vardd 
	dbContextdd 
=dd 
scopedd 
.dd 
ServiceProviderdd )
.dd) *
GetRequiredServicedd* <
<dd< =
RestaurantDbContextdd= P
>ddP Q
(ddQ R
)ddR S
;ddS T
	dbContextee 
.ee 
Databaseee 
.ee 
Migrateee 
(ee 
)ee  
;ee  !
}ff 
appgg 
.gg 
Rungg 
(gg 
)gg 	
;gg	 
á

]C:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Models\UpdateRestaurantDto.cs
	namespace 	
RestaurantService
 
. 
Models "
{ 
public 

class 
UpdateRestaurantDto $
{ 
[ 	
Required	 
] 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[

 	
Required

	 
]

 
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
public 
string 
Cuisine 
{ 
get  #
;# $
set% (
;( )
}* +
public 
double 
Rating 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} °
[C:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Models\UpdateFoodItemDto.cs
	namespace 	
RestaurantService
 
. 
Models "
{ 
public 

class 
UpdateFoodItemDto "
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
Guid 
RestaurantId  
{! "
get# &
;& '
set( +
;+ ,
}- .
}		 
}

 ï
WC:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Models\RestaurantDto.cs
	namespace 	
RestaurantService
 
. 
Models "
{ 
public 
class 
RestaurantDto 
{ 
public 

Guid 
RestaurantId 
{ 
get "
;" #
set$ '
;' (
}) *
public 

string 
Name 
{ 
get 
; 
set !
;! "
}# $
public 

string 
Address 
{ 
get 
;  
set! $
;$ %
}& '
public		 

string		 
Phone		 
{		 
get		 
;		 
set		 "
;		" #
}		$ %
public

 

string

 
Cuisine

 
{

 
get

 
;

  
set

! $
;

$ %
}

& '
public 

double 
Rating 
{ 
get 
; 
set  #
;# $
}% &
public 

List 
< 
FoodItemDto 
> 
	FoodItems &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
} €
TC:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Models\Restaurant.cs
	namespace 	
RestaurantService
 
. 
Models "
{ 
public 

class 

Restaurant 
{ 
[ 	
Key	 
] 
public 
Guid 
RestaurantId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
Address

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Cuisine 
{ 
get  #
;# $
set% (
;( )
}* +
public 
double 
Rating 
{ 
get "
;" #
set$ '
;' (
}) *
public	 
ICollection 
< 
FoodItem $
>$ %
	FoodItems& /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
=> ?
new@ C
ListD H
<H I
FoodItemI Q
>Q R
(R S
)S T
;T U
} 
} —	
[C:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Models\ReadRestaurantDto.cs
	namespace 	
RestaurantService
 
. 
Models "
{ 
public 

class 
ReadRestaurantDto "
{ 
public 
Guid 
RestaurantId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
Address		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public

 
string

 
Phone

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
Cuisine 
{ 
get  #
;# $
set% (
;( )
}* +
public 
double 
Rating 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ç	
UC:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Models\JwtSettings.cs
	namespace 	
RestaurantService
 
. 
Models "
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
 ç
UC:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Models\FoodItemDto.cs
	namespace 	
RestaurantService
 
. 
Models "
{ 
public 
class 
FoodItemDto 
{ 
public 

Guid 

FoodItemId 
{ 
get  
;  !
set" %
;% &
}' (
public 

string 
Name 
{ 
get 
; 
set !
;! "
}# $
public 

decimal 
Price 
{ 
get 
; 
set  #
;# $
}% &
public 

string 
Description 
{ 
get  #
;# $
set% (
;( )
}* +
}		 
}

 ‹	
RC:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Models\FoodItem.cs
	namespace 	
RestaurantService
 
. 
Models "
{ 
public 

class 
FoodItem 
{ 
public 
Guid 

FoodItemId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
Guid 
RestaurantId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 

Restaurant 
? 

Restaurant %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} ∑

]C:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Models\CreateRestaurantDto.cs
	namespace 	
RestaurantService
 
. 
Models "
{ 
public 

class 
CreateRestaurantDto $
{ 
[ 	
Required	 
] 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[

 	
Required

	 
]

 
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
public 
string 
Cuisine 
{ 
get  #
;# $
set% (
;( )
}* +
public 
double 
Rating 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
$num- .
;. /
} 
} …
[C:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Models\CreateFoodItemDto.cs
	namespace 	
RestaurantService
 
. 
Models "
{ 
public 

class 
CreateFoodItemDto "
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
string		 
Description		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
=		0 1
string		2 8
.		8 9
Empty		9 >
;		> ?
public 
Guid 
RestaurantId  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} ö 
nC:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Migrations\20250510124002_AddFoodItemsTable.cs
	namespace 	
RestaurantService
 
. 

Migrations &
{ 
public		 

partial		 
class		 
AddFoodItemsTable		 *
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
$str !
,! "
columns 
: 
table 
=> !
new" %
{ 

FoodItemId 
=  
table! &
.& '
Column' -
<- .
Guid. 2
>2 3
(3 4
type4 8
:8 9
$str: L
,L M
nullableN V
:V W
falseX ]
)] ^
,^ _
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 E
,E F
	maxLengthG P
:P Q
$numR U
,U V
nullableW _
:_ `
falsea f
)f g
,g h
Price 
= 
table !
.! "
Column" (
<( )
decimal) 0
>0 1
(1 2
type2 6
:6 7
$str8 G
,G H
nullableI Q
:Q R
falseS X
)X Y
,Y Z
Description 
=  !
table" '
.' (
Column( .
<. /
string/ 5
>5 6
(6 7
type7 ;
:; <
$str= L
,L M
	maxLengthN W
:W X
$numY \
,\ ]
nullable^ f
:f g
falseh m
)m n
,n o
RestaurantId  
=! "
table# (
.( )
Column) /
</ 0
Guid0 4
>4 5
(5 6
type6 :
:: ;
$str< N
,N O
nullableP X
:X Y
falseZ _
)_ `
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
$str% 3
,3 4
x5 6
=>7 9
x: ;
.; <

FoodItemId< F
)F G
;G H
table 
. 

ForeignKey $
($ %
name 
: 
$str E
,E F
column 
: 
x  !
=>" $
x% &
.& '
RestaurantId' 3
,3 4
principalTable &
:& '
$str( 5
,5 6
principalColumn '
:' (
$str) 7
,7 8
onDelete    
:    !
ReferentialAction  " 3
.  3 4
Cascade  4 ;
)  ; <
;  < =
}!! 
)!! 
;!! 
migrationBuilder## 
.## 
CreateIndex## (
(##( )
name$$ 
:$$ 
$str$$ 1
,$$1 2
table%% 
:%% 
$str%% "
,%%" #
column&& 
:&& 
$str&& &
)&&& '
;&&' (
}'' 	
	protected** 
override** 
void** 
Down**  $
(**$ %
MigrationBuilder**% 5
migrationBuilder**6 F
)**F G
{++ 	
migrationBuilder,, 
.,, 
	DropTable,, &
(,,& '
name-- 
:-- 
$str-- !
)--! "
;--" #
}.. 	
}// 
}00 í
mC:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Migrations\20250510122254_AddFoodItemTable.cs
	namespace 	
RestaurantService
 
. 

Migrations &
{ 
public 

partial 
class 
AddFoodItemTable )
:* +
	Migration, 5
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
} ¯
jC:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Migrations\20250506073653_InitialCreate.cs
	namespace 	
RestaurantService
 
. 

Migrations &
{ 
public		 

partial		 
class		 
InitialCreate		 &
:		' (
	Migration		) 2
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
$str #
,# $
columns 
: 
table 
=> !
new" %
{ 
RestaurantId  
=! "
table# (
.( )
Column) /
</ 0
Guid0 4
>4 5
(5 6
type6 :
:: ;
$str< N
,N O
nullableP X
:X Y
falseZ _
)_ `
,` a
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 E
,E F
	maxLengthG P
:P Q
$numR U
,U V
nullableW _
:_ `
falsea f
)f g
,g h
Address 
= 
table #
.# $
Column$ *
<* +
string+ 1
>1 2
(2 3
type3 7
:7 8
$str9 H
,H I
	maxLengthJ S
:S T
$numU X
,X Y
nullableZ b
:b c
falsed i
)i j
,j k
Phone 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
type1 5
:5 6
$str7 E
,E F
	maxLengthG P
:P Q
$numR T
,T U
nullableV ^
:^ _
false` e
)e f
,f g
Cuisine 
= 
table #
.# $
Column$ *
<* +
string+ 1
>1 2
(2 3
type3 7
:7 8
$str9 G
,G H
	maxLengthI R
:R S
$numT V
,V W
nullableX `
:` a
falseb g
)g h
,h i
Rating 
= 
table "
." #
Column# )
<) *
double* 0
>0 1
(1 2
type2 6
:6 7
$str8 B
,B C
	precisionD M
:M N
$numO P
,P Q
scaleR W
:W X
$numY Z
,Z [
nullable\ d
:d e
falsef k
)k l
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 5
,5 6
x7 8
=>9 ;
x< =
.= >
RestaurantId> J
)J K
;K L
} 
) 
; 
} 	
	protected   
override   
void   
Down    $
(  $ %
MigrationBuilder  % 5
migrationBuilder  6 F
)  F G
{!! 	
migrationBuilder"" 
."" 
	DropTable"" &
(""& '
name## 
:## 
$str## #
)### $
;##$ %
}$$ 	
}%% 
}&& ò(
[C:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Data\RestaurantDbContext.cs
	namespace 	
RestaurantService
 
. 
Data  
{ 
public 

class 
RestaurantDbContext $
:% &
	DbContext' 0
{ 
public 
RestaurantDbContext "
(" #
DbContextOptions# 3
<3 4
RestaurantDbContext4 G
>G H
optionsI P
)P Q
:		 
base		 
(		 
options		 
)		 
{		 
}		 
public 
DbSet 
< 

Restaurant 
>  
Restaurants! ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public
 
DbSet 
< 
FoodItem 
>  
	FoodItems! *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
base 
. 
OnModelCreating  
(  !
modelBuilder! -
)- .
;. /
modelBuilder 
. 
Entity 
<  

Restaurant  *
>* +
(+ ,
r, -
=>. 0
{ 
r 
. 
HasKey 
( 
x 
=> 
x 
.  
RestaurantId  ,
), -
;- .
r 
. 
Property 
( 
x 
=> 
x  !
.! "
Name" &
)& '
.' (

IsRequired( 2
(2 3
)3 4
.4 5
HasMaxLength5 A
(A B
$numB E
)E F
;F G
r 
. 
Property 
( 
x 
=> 
x  !
.! "
Address" )
)) *
.* +
HasMaxLength+ 7
(7 8
$num8 ;
); <
;< =
r 
. 
Property 
( 
x 
=> 
x  !
.! "
Phone" '
)' (
.( )
HasMaxLength) 5
(5 6
$num6 8
)8 9
;9 :
r 
. 
Property 
( 
x 
=> 
x  !
.! "
Cuisine" )
)) *
.* +
HasMaxLength+ 7
(7 8
$num8 :
): ;
;; <
r 
. 
Property 
( 
x 
=> 
x  !
.! "
Rating" (
)( )
.) *
HasPrecision* 6
(6 7
$num7 8
,8 9
$num: ;
); <
;< =
r 
. 
HasMany 
( 
x 
=>  
x! "
." #
	FoodItems# ,
), -
. 
WithOne 
( 
x 
=> 
x  
.  !

Restaurant! +
)+ ,
. 
HasForeignKey 
(  
x  !
=>" $
x% &
.& '
RestaurantId' 3
)3 4
. 
OnDelete 
( 
DeleteBehavior )
.) *
Cascade* 1
)1 2
;2 3
} 
) 
; 
modelBuilder!! 
.!! 
Entity!! "
<!!" #
FoodItem!!# +
>!!+ ,
(!!, -
f!!- .
=>!!/ 1
{"" 
f## 
.## 
HasKey## 
(## 
x## 
=>## 
x## 
.##  

FoodItemId##  *
)##* +
;##+ ,
f$$ 
.$$ 
Property$$ 
($$ 
x$$ 
=>$$ 
x$$  !
.$$! "
Name$$" &
)$$& '
.$$' (

IsRequired$$( 2
($$2 3
)$$3 4
.$$4 5
HasMaxLength$$5 A
($$A B
$num$$B E
)$$E F
;$$F G
f%% 
.%% 
Property%% 
(%% 
x%% 
=>%% 
x%%  !
.%%! "
Price%%" '
)%%' (
.%%( )
HasColumnType%%) 6
(%%6 7
$str%%7 G
)%%G H
;%%H I
f&& 
.&& 
Property&& 
(&& 
x&& 
=>&& 
x&&  !
.&&! "
Description&&" -
)&&- .
.&&. /
HasMaxLength&&/ ;
(&&; <
$num&&< ?
)&&? @
;&&@ A
}'' 
)'' 
;'' 
}(( 	
})) 
}** ÄK
cC:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Controllers\RestaurantController.cs
	namespace

 	
RestaurantService


 
.

 
Controllers

 '
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class  
RestaurantController %
:& '
ControllerBase( 6
{ 
private 
readonly 
IRestaurantService +
_service, 4
;4 5
private 
readonly 
RestaurantDbContext ,
_context- 5
;5 6
public  
RestaurantController #
(# $
IRestaurantService$ 6
service7 >
,> ?
RestaurantDbContext@ S
contextT [
)[ \
{ 	
_service 
= 
service 
; 
_context 
= 
context 
; 
} 	
["" 	
HttpGet""	 
]"" 
public## 
async## 
Task## 
<## 
ActionResult## &
<##& '
IEnumerable##' 2
<##2 3
RestaurantDto##3 @
>##@ A
>##A B
>##B C
GetAll##D J
(##J K
[##K L
	FromQuery##L U
]##U V
bool##W [
includeFoodItems##\ l
=##m n
false##o t
)##t u
{$$ 	
var%% 
restaurants%% 
=%% 
includeFoodItems%% .
?&& 
await&& 
_context&&  
.&&  !
Restaurants&&! ,
.'' 
Include'' 
('' 
r'' 
=>'' !
r''" #
.''# $
	FoodItems''$ -
)''- .
.(( 
Select(( 
((( 
r(( 
=>((  
new((! $
RestaurantDto((% 2
{)) 
RestaurantId** $
=**% &
r**' (
.**( )
RestaurantId**) 5
,**5 6
Name++ 
=++ 
r++  
.++  !
Name++! %
,++% &
Address,, 
=,,  !
r,," #
.,,# $
Address,,$ +
,,,+ ,
Phone-- 
=-- 
r--  !
.--! "
Phone--" '
,--' (
Cuisine.. 
=..  !
r.." #
...# $
Cuisine..$ +
,..+ ,
Rating// 
=//  
r//! "
.//" #
Rating//# )
,//) *
	FoodItems00 !
=00" #
r00$ %
.00% &
	FoodItems00& /
.00/ 0
Select000 6
(006 7
f007 8
=>009 ;
new00< ?
FoodItemDto00@ K
{11 

FoodItemId22 &
=22' (
f22) *
.22* +

FoodItemId22+ 5
,225 6
Name33  
=33! "
f33# $
.33$ %
Name33% )
,33) *
Price44 !
=44" #
f44$ %
.44% &
Price44& +
,44+ ,
Description55 '
=55( )
f55* +
.55+ ,
Description55, 7
}66 
)66 
.66 
ToList66 !
(66! "
)66" #
}77 
)77 
.77 
ToListAsync77 "
(77" #
)77# $
:99 
await99 
_context99  
.99  !
Restaurants99! ,
.:: 
Select:: 
(:: 
r:: 
=>::  
new::! $
RestaurantDto::% 2
{;; 
RestaurantId<< $
=<<% &
r<<' (
.<<( )
RestaurantId<<) 5
,<<5 6
Name== 
=== 
r==  
.==  !
Name==! %
,==% &
Address>> 
=>>  !
r>>" #
.>># $
Address>>$ +
,>>+ ,
Phone?? 
=?? 
r??  !
.??! "
Phone??" '
,??' (
Cuisine@@ 
=@@  !
r@@" #
.@@# $
Cuisine@@$ +
,@@+ ,
RatingAA 
=AA  
rAA! "
.AA" #
RatingAA# )
,AA) *
	FoodItemsBB !
=BB" #
nullBB$ (
}CC 
)CC 
.CC 
ToListAsyncCC "
(CC" #
)CC# $
;CC$ %
returnEE 
OkEE 
(EE 
restaurantsEE !
)EE! "
;EE" #
}FF 	
[II 	
HttpGetII	 
(II 
$strII 
)II 
]II 
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
ActionResultJJ &
<JJ& '

RestaurantJJ' 1
>JJ1 2
>JJ2 3
GetByIdJJ4 ;
(JJ; <
GuidJJ< @
idJJA C
)JJC D
{KK 	
varLL 

restaurantLL 
=LL 
awaitLL "
_serviceLL# +
.LL+ ,"
GetRestaurantByIdAsyncLL, B
(LLB C
idLLC E
)LLE F
;LLF G
ifMM 
(MM 

restaurantMM 
==MM 
nullMM "
)MM" #
returnMM$ *
NotFoundMM+ 3
(MM3 4
)MM4 5
;MM5 6
returnNN 
OkNN 
(NN 

restaurantNN  
)NN  !
;NN! "
}OO 	
[RR 	
HttpPostRR	 
]RR 
publicSS 
asyncSS 
TaskSS 
<SS 
ActionResultSS &
<SS& '

RestaurantSS' 1
>SS1 2
>SS2 3
CreateSS4 :
(SS: ;
CreateRestaurantDtoSS; N
dtoSSO R
)SSR S
{TT 	
varUU 

restaurantUU 
=UU 
newUU  

RestaurantUU! +
{VV 
RestaurantIdWW 
=WW 
GuidWW #
.WW# $
NewGuidWW$ +
(WW+ ,
)WW, -
,WW- .
NameXX 
=XX 
dtoXX 
.XX 
NameXX 
,XX  
AddressYY 
=YY 
dtoYY 
.YY 
AddressYY %
,YY% &
PhoneZZ 
=ZZ 
dtoZZ 
.ZZ 
PhoneZZ !
,ZZ! "
Cuisine[[ 
=[[ 
dto[[ 
.[[ 
Cuisine[[ %
,[[% &
Rating\\ 
=\\ 
dto\\ 
.\\ 
Rating\\ #
}]] 
;]] 
var__ 
created__ 
=__ 
await__ 
_service__  (
.__( )!
CreateRestaurantAsync__) >
(__> ?

restaurant__? I
)__I J
;__J K
return`` 
CreatedAtAction`` "
(``" #
nameof``# )
(``) *
GetById``* 1
)``1 2
,``2 3
new``4 7
{``8 9
id``: <
=``= >
created``? F
.``F G
RestaurantId``G S
}``T U
,``U V
created``W ^
)``^ _
;``_ `
}aa 	
[cc 	
HttpPutcc	 
(cc 
$strcc 
)cc 
]cc 
publicdd 
asyncdd 
Taskdd 
<dd 
IActionResultdd '
>dd' (
Updatedd) /
(dd/ 0
Guiddd0 4
iddd5 7
,dd7 8
UpdateRestaurantDtodd9 L
dtoddM P
)ddP Q
{ee 	
varff 
existingRestaurantff "
=ff# $
awaitff% *
_serviceff+ 3
.ff3 4"
GetRestaurantByIdAsyncff4 J
(ffJ K
idffK M
)ffM N
;ffN O
ifgg 
(gg 
existingRestaurantgg "
==gg# %
nullgg& *
)gg* +
returngg, 2
NotFoundgg3 ;
(gg; <
)gg< =
;gg= >
existingRestaurantjj 
.jj 
Namejj #
=jj$ %
dtojj& )
.jj) *
Namejj* .
;jj. /
existingRestaurantkk 
.kk 
Addresskk &
=kk' (
dtokk) ,
.kk, -
Addresskk- 4
;kk4 5
existingRestaurantll 
.ll 
Phonell $
=ll% &
dtoll' *
.ll* +
Phonell+ 0
;ll0 1
existingRestaurantmm 
.mm 
Cuisinemm &
=mm' (
dtomm) ,
.mm, -
Cuisinemm- 4
;mm4 5
existingRestaurantnn 
.nn 
Ratingnn %
=nn& '
dtonn( +
.nn+ ,
Ratingnn, 2
;nn2 3
awaitpp 
_servicepp 
.pp !
UpdateRestaurantAsyncpp 0
(pp0 1
existingRestaurantpp1 C
)ppC D
;ppD E
returnqq 
	NoContentqq 
(qq 
)qq 
;qq 
}rr 	
[tt 	

HttpDeletett	 
(tt 
$strtt 
)tt 
]tt 
publicuu 
asyncuu 
Taskuu 
<uu 
IActionResultuu '
>uu' (
Deleteuu) /
(uu/ 0
Guiduu0 4
iduu5 7
)uu7 8
{vv 	
awaitww 
_serviceww 
.ww !
DeleteRestaurantAsyncww 0
(ww0 1
idww1 3
)ww3 4
;ww4 5
returnxx 
	NoContentxx 
(xx 
)xx 
;xx 
}yy 	
}zz 
}{{ œ2
aC:\Users\msi bravo\Desktop\FoodOrderingSystem\RestaurantService\Controllers\FoodItemController.cs
	namespace 	
RestaurantService
 
. 
Controllers '
{ 
[		 
ApiController		 
]		 
[

 
Route

 

(


 
$str

 
)

 
]

 
public 

class 
FoodItemController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
RestaurantDbContext ,
_context- 5
;5 6
public 
FoodItemController !
(! "
RestaurantDbContext" 5
context6 =
)= >
{ 	
_context 
= 
context 
; 
} 	
[ 	
HttpGet	 
( 
$str ,
), -
]- .
public 
async 
Task 
< 
ActionResult &
<& '
IEnumerable' 2
<2 3
FoodItem3 ;
>; <
>< =
>= >
GetByRestaurant? N
(N O
GuidO S
restaurantIdT `
)` a
{ 	
return 
await 
_context !
.! "
	FoodItems" +
. 
Where 
( 
f 
=> 
f 
. 
RestaurantId *
==+ -
restaurantId. :
): ;
. 
ToListAsync 
( 
) 
; 
} 	
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
FoodItem' /
>/ 0
>0 1
Create2 8
(8 9
RestaurantService9 J
.J K
ModelsK Q
.Q R
CreateFoodItemDtoR c
dtod g
)g h
{ 	
var 
foodItem 
= 
new  
FoodItem! )
{   

FoodItemId!! 
=!! 
Guid!! 
.!! 
NewGuid!! !
(!!! "
)!!" #
,!!# $
Name"" 
="" 
dto"" 
."" 
Name"" 
,"" 
Price## 
=## 
dto## 
.## 
Price## 
,## 
Description$$ 
=$$ 
dto$$ 
.$$ 
Description$$ %
,$$% &
RestaurantId%% 
=%% 
dto%% 
.%% 
RestaurantId%% '
}&& 
;&& 
_context'' 
.'' 
	FoodItems'' 
.'' 
Add'' "
(''" #
foodItem''# +
)''+ ,
;'', -
await(( 
_context(( 
.(( 
SaveChangesAsync(( +
(((+ ,
)((, -
;((- .
return)) 
CreatedAtAction)) "
())" #
nameof))# )
())) *
GetByRestaurant))* 9
)))9 :
,)): ;
new))< ?
{))@ A
restaurantId))B N
=))O P
foodItem))Q Y
.))Y Z
RestaurantId))Z f
}))g h
,))h i
foodItem))j r
)))r s
;))s t
}** 	
[,, 	
HttpPut,,	 
(,, 
$str,, 
),, 
],, 
public-- 
async-- 
Task-- 
<-- 
IActionResult-- 
>--  
Update--! '
(--' (
Guid--( ,
id--- /
,--/ 0
UpdateFoodItemDto--1 B
dto--C F
)--F G
{.. 
var// 
existingFoodItem// 
=// 
await//  
_context//! )
.//) *
	FoodItems//* 3
.//3 4
	FindAsync//4 =
(//= >
id//> @
)//@ A
;//A B
if00 
(00 
existingFoodItem00 
==00 
null00  
)00  !
return11 
NotFound11 
(11 
)11 
;11 
existingFoodItem44 
.44 
Name44 
=44 
dto44 
.44  
Name44  $
;44$ %
existingFoodItem55 
.55 
Price55 
=55 
dto55  
.55  !
Price55! &
;55& '
existingFoodItem66 
.66 
Description66  
=66! "
dto66# &
.66& '
Description66' 2
;662 3
existingFoodItem77 
.77 
RestaurantId77 !
=77" #
dto77$ '
.77' (
RestaurantId77( 4
;774 5
_context99 
.99 
Entry99 
(99 
existingFoodItem99 #
)99# $
.99$ %
State99% *
=99+ ,
EntityState99- 8
.998 9
Modified999 A
;99A B
await:: 	
_context::
 
.:: 
SaveChangesAsync:: #
(::# $
)::$ %
;::% &
return<< 

	NoContent<< 
(<< 
)<< 
;<< 
}== 
[@@ 	

HttpDelete@@	 
(@@ 
$str@@ 
)@@ 
]@@ 
publicAA 
asyncAA 
TaskAA 
<AA 
IActionResultAA '
>AA' (
DeleteAA) /
(AA/ 0
GuidAA0 4
idAA5 7
)AA7 8
{BB 	
varCC 
itemCC 
=CC 
awaitCC 
_contextCC %
.CC% &
	FoodItemsCC& /
.CC/ 0
	FindAsyncCC0 9
(CC9 :
idCC: <
)CC< =
;CC= >
ifDD 
(DD 
itemDD 
==DD 
nullDD 
)DD 
returnDD $
NotFoundDD% -
(DD- .
)DD. /
;DD/ 0
_contextFF 
.FF 
	FoodItemsFF 
.FF 
RemoveFF %
(FF% &
itemFF& *
)FF* +
;FF+ ,
awaitGG 
_contextGG 
.GG 
SaveChangesAsyncGG +
(GG+ ,
)GG, -
;GG- .
returnHH 
	NoContentHH 
(HH 
)HH 
;HH 
}II 	
}JJ 
}KK 