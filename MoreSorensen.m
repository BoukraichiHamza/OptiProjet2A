
function [s,lambda,q]=MoreSorensen(gradf,hessf,delta)

[V,D] = eig(hessf);
d = diag(D);
[d,p] = sort(d,'ascend');
V = V(:,p);

solution_trouvee = false;

if (d(1) >= 0)

    z = V'*gradf;
    if d(1) < eps*norm(hessf,'fro')
        if norm(D(1)'*g)< eps * norm(z)
            s = V(:,2:end)*(z(2:end)./(d(2:end)));
            solution_trouvee = true;
            lambda = 0;
        else
            solution_trouvee = false;
        end
    else

        sn = -hessf\gradf;
        if (norm(sn) <= delta)
            s = sn;
            lambda = 0;
            solution_trouvee = true;
        end
    end
end


if ~solution_trouvee
       %Sauvegarde de la valeur de lambda1
     lambda1 = d(1);
      z = V'*gradf;
    if abs(z(1)) > eps*norm(gradf)
        
         %Valeur de la fonction
        h_phi = @(lambda)phi(lambda, z, d, delta, false);
        h_dphi = @(lambda)derivephi(lambda, z, d, delta, false);
        
        %Creation de lambda0 ( BackTracking - ForwardTracking)
       
        % back-tracking de lambda_min
        depart = max(0, -lambda1);
        if (depart == -lambda1)
            h = 0.1;
            depart = -lambda1+h;
            
            % si toujours pas positif, on réduit h
            while (h_phi(depart) < 0)
                h = h/2;
                depart = -lambda1+h;
            end
        end
        
        % forward-tracking de lambda_max
        h = 10;
        arrivee = max(0, -lambda1) + h;
        
        % si toujours pas négatif, on augmente h
        while (h_phi(arrivee) > 0)
            h = 2*h;
            arrivee = max(0, -lambda1) + h;
        end
        
        lambda0 = [ depart; arrivee];
         %Resolution de l'équation
        
        lambda = NewtonNonLineaire(h_phi,h_dphi,lambda0,1e-10);
        %Calcule de s
        s = V*(-z ./ (lambda + d));
        
        
       

        
    else
        V1 = V(:,1);
        V = V(:,2:end);
        d = d(2:end);
        z = z(2:end);
        
        %Valeur de la fonction
        
        h_phi = @(lambda)phi(lambda, z, d, delta, false);
        h_dphi = @(lambda)derivephi(lambda, z, d, delta, false);

        
        if h_phi(-lambda1) > 0

             %Creation de lambda0 ( BackTracking - ForwardTracking)
              %pas besoin de  back-tracking de lambda_min
            depart = max(0, -lambda1);
        
          % forward-tracking de lambda_max
              h = 10;
          arrivee = max(0, -lambda1) + h;
        
             % si toujours pas négatif, on augmente h
            while (h_phi(arrivee) > 0)
                h = 2*h;
                arrivee = max(0, -lambda1) + h;
            end
        
            lambda0 = [ depart; arrivee];
        
        
          %Resolution de l'équation
        
            lambda = NewtonNonLineaire(h_phi,h_dphi,lambda0,1e-10);
            s = V*(-z ./ (lambda + d));
        else
            %Cas difficile
             lambda = -lambda1;
              alpha = sqrt(-h_phi(lambda));
              s = V*(-z ./ (lambda + d)) + alpha*V1;
             
        end
    end
end
q = gradf'*s + (0.5)*s'*hessf*s;

end
    
    