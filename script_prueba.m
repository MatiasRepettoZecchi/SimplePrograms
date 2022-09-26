clear;
casos_de_prueba

mat_salidaColumnas = length(mat_casos(1,:));
mat_salidaFilas = length(mat_casos(:,1));
fallos = [];

sz = size(mat_salida_ref);
mat_salida = zeros(sz);

for i = 1:mat_salidaFilas
  [pos, cc] = encontrarMejor(vect_ref, mat_casos(i,:));
  if pos != -1 && cc != -1
    mat_salida(i,:) = vect_ref(pos:pos+length(mat_casos(i,:))-1);
    if length(mat_salida_ref) != 0 && !isequal(mat_salida(i,:), mat_salida_ref(i,:))
      fallos(length(fallos)+1) = i;
    endif
  endif
endfor
