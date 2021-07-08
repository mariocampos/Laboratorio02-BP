<h1 class="code-line" data-line-start=0 data-line-end=1 ><a id="Laboratorio_02_0"></a>Laboratorio 02</h1>
<hr>
<p class="has-line-data" data-line-start="2" data-line-end="3">En este laboratorio se instalará <strong>Nginx</strong> en una imagen mediante <strong>Dockerfile</strong></p>
<ol>
<li class="has-line-data" data-line-start="4" data-line-end="5">Creando carpeta</li>
</ol>
<pre><code class="has-line-data" data-line-start="6" data-line-end="8" class="language-sh"><span class="hljs-variable">$mkdir</span> Nginx
</code></pre>
<ol start="2">
<li class="has-line-data" data-line-start="8" data-line-end="9">Ingresando a la carpeta creada y editando archivo <em>Dockerfile</em></li>
</ol>
<pre><code class="has-line-data" data-line-start="10" data-line-end="13" class="language-sh"><span class="hljs-variable">$cd</span> Nginx
<span class="hljs-variable">$vi</span> Dockerfile
</code></pre>
<ol start="3">
<li class="has-line-data" data-line-start="13" data-line-end="14">Dentro del <em>Dockerfile</em></li>
</ol>
<pre><code class="has-line-data" data-line-start="15" data-line-end="20" class="language-sh">FROM nginx:<span class="hljs-number">1.20</span>.<span class="hljs-number">1</span>
COPY ./index.html /usr/share/nginx/html/index.html
RUN apt-get update &amp;&amp; apt install net-tools
EXPOSE <span class="hljs-number">80</span>
</code></pre>
<blockquote>
<p class="has-line-data" data-line-start="20" data-line-end="21">Se está instalando una versión estable de Nginx (1.20.1), luego se está copiando el archivo index.html creado hacia el directorio del servidor.</p>
</blockquote>
<ol start="4">
<li class="has-line-data" data-line-start="22" data-line-end="23">Se crea la imagen y se valida</li>
</ol>
<pre><code class="has-line-data" data-line-start="24" data-line-end="29" class="language-sh"><span class="hljs-variable">$docker</span> build -t --name=mario-v1 nginx:mario-v1
<span class="hljs-variable">$docker</span> images
REPOSITORY      TAG          IMAGE ID          CREATED             SIZE
nginx           mario-v1     <span class="hljs-number">3</span>bdbc93faad2      <span class="hljs-number">43</span> minutes ago      <span class="hljs-number">153</span>MB
</code></pre>
<blockquote>
<p class="has-line-data" data-line-start="29" data-line-end="30">Donde <em>-t</em> indica el tag (nombre) que le estoy otorgando a la imagen.</p>
</blockquote>
<ol start="5">
<li class="has-line-data" data-line-start="30" data-line-end="31">Se crea el contenedor</li>
</ol>
<pre><code class="has-line-data" data-line-start="32" data-line-end="35" class="language-sh"><span class="hljs-variable">$docker</span> run <span class="hljs-operator">-d</span> -p <span class="hljs-number">8080</span>:<span class="hljs-number">80</span> -v ~/Nginx/index.html:/usr/share/nginx/html/index.html --name=mario-v1 nginx:mario-v1
<span class="hljs-number">7856389</span>d60595d538cc8c2a6af35d90a71c63478eb727a9e2710d1854f3260c6
</code></pre>
<blockquote>
<p class="has-line-data" data-line-start="35" data-line-end="36">En la creación del contenedor ejecuto -d para que corra en background, -p para asignarle el puerto al servidor y -v para darle un volume y el archivo index pueda sincronizarce en caso se realicen algunos cambios.</p>
</blockquote>
<ol start="6">
<li class="has-line-data" data-line-start="37" data-line-end="38">Ejecutamos <em>docker ps</em> para tener detalle del contenedor</li>
</ol>
<pre><code class="has-line-data" data-line-start="39" data-line-end="43" class="language-sh"><span class="hljs-variable">$docker</span> ps
CONTAINER ID   IMAGE            COMMAND                  CREATED         STATUS         PORTS                               NAMES
<span class="hljs-number">7856389</span>d6059   nginx:mario-v1   <span class="hljs-string">"/docker-entrypoint.…"</span>   <span class="hljs-number">2</span> minutes ago   Up <span class="hljs-number">2</span> minutes   <span class="hljs-number">0.0</span>.<span class="hljs-number">0.0</span>:<span class="hljs-number">81</span>-&gt;<span class="hljs-number">80</span>/tcp, :::<span class="hljs-number">81</span>-&gt;<span class="hljs-number">80</span>/tcp   mario-v1
</code></pre>
<ol start="7">
<li class="has-line-data" data-line-start="43" data-line-end="44">Revisando el archivo index.html</li>
</ol>
<pre><code class="has-line-data" data-line-start="45" data-line-end="56" class="language-sh"><span class="hljs-variable">$vi</span> index.html
&lt;!DOCTYPE html&gt;
&lt;html lang=<span class="hljs-string">"en"</span>&gt;
&lt;head&gt;
    &lt;title&gt;Mi web NGINX&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
    &lt;p&gt;Mi primera web con Nginx&lt;/p&gt;
&lt;/body&gt;
&lt;/html&gt;
</code></pre>
