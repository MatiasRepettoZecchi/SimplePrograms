clear;
casos_de_prueba

mat_salidaColumnas = length(mat_casos(1,:));
mat_salidaFilas = length(mat_casos(:,1));
fallos = [];

sz = size(mat_salida_ref);
mat_salida = zeros(sz);

for i = 1:mat_salidaFilas
  [pos, cc] = encontrearMejor(vect_ref, mat_casos(i,:));
  if pos != -1 && cc != -1
    mat_salida(i,:) = vect_ref(pos:mat_salidaColumnas);
    if mat_salida(i,:) != mat_salida_ref(i,:)
      fallos(length(fallos)+1) = i;
    endif
  endif
endfor
