function [final,frames] = abeliansand(initial,frames)
  [row,col] = size(initial);
  
  for r=1:row
      for c=1:col
          if initial(r,c) > 3
              if r == 1
                  initial = [zeros(1,col); initial];
                  r = 2;
                  row = row + 1;
              end
              
              if r == row
                  initial = [initial; zeros(1,col)];
                  row = row + 1;
              end
              
              if c == 1
                  initial = [zeros(row,1), initial];
                  c = 2;
                  col = col + 1;
              end
              
              if c == col
                  initial = [initial, zeros(row,1)];
                  col = col + 1;
              end
                            
              initial(r-1,c) = initial(r-1,c) + 1;
              initial(r+1,c) = initial(r+1,c) + 1;                               
              initial(r,c-1) = initial(r,c-1) + 1;              
              initial(r,c+1) = initial(r,c+1) + 1;              
              initial(r,c) = initial(r,c) - 4;
          end
      end
  end
  
  if sum(any(initial>3)) > 0
      frames{end+1} = initial; 
      [final, frames] = abeliansand(initial,frames);
  else
      final = initial;
      frames{end+1} = final;
      for x=1:length(frames)
          frames{x} = double2rgb(frames{x},jet);
          frames{x} = imresize(frames{x},[500 500],'box');
      end
      
      for count=1:40
          frames = cat(2,frames{1},frames);
          frames{end+1} = frames{end};
      end 
       
      cell2vid(frames,'abeliansand_flow.mp4',20);
  end

end