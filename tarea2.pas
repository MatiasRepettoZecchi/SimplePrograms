
{ InCo - Programación 1 }
{ Laboratorio 2019      }

{ esqueleto de archivo tarea2.pas a ser entregado}


function esPrefijo (pal1,pal2 : TipoPalabra) : boolean;
var i:integer;
begin
	i := 1;
	if (pal1.largo) > (pal2.largo) then
		esPrefijo := false
	else if (pal1.largo = 0) then
		esPrefijo := true
	else
		while (i <= pal1.largo) and (pal1.info[i] = pal2.info[i]) do
		begin
			i := i+1;
			esPrefijo := i > pal1.largo
		end
end;

function igualPalabra (pal1,pal2 : TipoPalabra) : boolean;
var i:integer;
begin
	i := 1;
	if (pal1.largo <> pal2.largo) then
		igualPalabra := false
	else
		while (i <= pal1.largo) and (pal1.info[i] = pal2.info[i]) do
		begin
			i := i+1;
			igualPalabra := i > pal1.largo;
		end
end;

procedure palabraADistancia
              ( palabra       : TipoPalabra;
                vocabulario   : TipoVocabulario;
                distancia     : TipoDistancia;
                var resultado : PosiblePalabra);
var i:integer;
begin
	i := 1;
    while (i <= MaxVocabulario) and (not(distanciaPalabra(palabra,vocabulario[i]) <= distancia)) do
        i := i+1;
    if (i <= MaxVocabulario) then
    begin
        resultado.hayPalabra := true;
        resultado.palabra := vocabulario[i];
    end    
    else
        resultado.hayPalabra := false;
end;

procedure masCercana
            ( vocabulario : TipoVocabulario;
              palabra     : TipoPalabra;
              var resultado : TipoPalabra;
              var distancia : TipoDistancia);
var i:integer;
begin
    distancia := distanciaPalabra(palabra,Vocabulario[1]);
    for i:= 1 to Maxvocabulario do
    begin
        if (distanciaPalabra(palabra,Vocabulario[i]) < distancia) then
        begin
            distancia := distanciaPalabra(palabra,Vocabulario[i]);
            resultado := Vocabulario[i]
        end
    end
end;

function pertenecePalabra (palabra : TipoPalabra; vocabulario : TipoVocabulario): boolean;
var i:integer;
begin
	i := 1;
	while (i <= MaxVocabulario) and (distanciaPalabra(palabra,vocabulario[i]) <> 0) do
		i := i+1;
	pertenecePalabra := i <= MaxVocabulario;
end;

function completarPalabra (prefijo : TipoPalabra; vocabulario : TipoVocabulario) : ListaPalabras;
var i:integer;
    lisaux1,lisaux2,lisaux3:ListaPalabras; 
begin
    lisaux3 := nil;
    for i := 1 to MaxVocabulario do
        if (esPrefijo(prefijo,vocabulario[i])) then
        begin
            new(lisaux1);
            lisaux1^.info := Vocabulario[i];
            lisaux1^.sig := nil;
            if (lisaux3 = nil) then
            begin
                lisaux3 := lisaux1;
            end
            else 
            begin
                lisaux2 := lisaux3;
                while(lisaux2^.sig <> nil) do
                    lisaux2 := lisaux2^.sig;
                lisaux2^.sig := lisaux1;
            end;
        end;
    completarPalabra := lisaux3;
end;

function estanTodas( lista : ListaPalabras; vocabulario : TipoVocabulario) : boolean;
begin
    while (lista <> nil) and (pertenecePalabra(lista^.info,vocabulario)) do
        lista := lista^.sig;
    estanTodas := lista = nil;
end;
