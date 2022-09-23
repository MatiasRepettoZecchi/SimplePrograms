function [pos, cc] = encontrarMejor(v1, v2)
  n1 = length(v1);
  n2 = length(v2);
  if n1 < n2 || n1 == 0 || n2 == 0
    pos = -1;
    cc = -1;
  elseif n1 == n2
    cc = 0;
    for i = 1:n1
      if v1(i) == v2(i)
        cc = cc + 1;
      endif
    endfor
    pos = 1;
  else
    aux = 0; % esta variable se usa como bandera para almacenar el mayor cc
    cc = 0;
    pos = 1;
    for i = 1:(n1-n2)
      for j = 1:n2
        if v1(i+j-1) == v2(j)
          cc = cc + 1;
        endif
      endfor
      if cc > aux;
        aux = cc;
        pos = i;
      endif
      cc = 0;
    endfor
    cc = aux;
  endif
  return
endfunction
