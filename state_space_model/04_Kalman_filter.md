<script>
MathJax = { 
    tex: {
    inlineMath: [            
    ['$', '$'],
    ['\\(', '\\)']
    ] }
};
</script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>


# 04_簡単な例でみるカルマンフィルタの考え方(時変ver)

この記事では、次のような測定を考える；  

- 測定対象の物理量は、真値$M_t$で時間的に変化する確率変数。$M_t$が従う確率過程は
$$
M_t = M_{t-1}+W_t,  \hspace{2em}   W_t\sim {\mathcal N}(0, \sigma_w^2) \tag{1}
$$
- 測定値$X_t$は誤差$V_t$を含んでいるの確率分布に従うものとする
$$
X_t = M_t + V_t,  \hspace{2em}  V_t\sim {\mathcal N}(0, \sigma_v^2)
\tag{2}
$$
前との差分は真値$M_t$が時間的に変化するという点にある
この前提で$t-1$時点から$t$時点へのカルマンフィルタを考える
---
推定の対象である$M$は確率変数であり、その実現値を得ることはできない。そのため、$M$の実現値の推定として、$M$の従う分布の平均値を採用する.
ここでは前提として$t-1$時点の$M_{t-1}$の確率分布は以下のように既に推定されているものとする；
$$M_{t-1}\sim\mathcal{N}(\hat{\mu}_{t-1},\hat{\sigma}_{t-1}) \tag{3}$$

### 事前分布の推定
(3),(1)より、$M_t$の推定分布は
$$
P(M_t=\mu_t) = \frac{1}{\sqrt{2\pi (\sigma_v^2 +\hat{\sigma}_{t-1}^2 )}}\exp\left[\frac{(\mu_t -\hat{\mu}_{t-1} )^2 }{2(\sigma_v^2 +\hat{\sigma}_{t-1}^2 )}\right]
\tag{4}$$
となる。この分布のことを事前分布と呼ぶ。またこの時点での状態の推定値$\mu_{t}^{(事前)}$として平均値の$\hat{\mu}_{t-1}$を採用し、フィルタ前推定値と呼ぶことにする。
### 尤度（条件付き確率）の推定
次に測定値$X_t=x_t$が得られたとして、その測定値が得られる尤度を考える。**尤度は$P(X_t=x_t|M_t=\mu_t)$であるから←あってるんかな？**、(2)に着目すると
$$
P(X_t=x_t|M_t=\mu_t) =  \frac{1}{\sqrt{2\pi \sigma_w^2 }}\exp\left[\frac{(x_t-\mu_t )^2 }{2\sigma_w^2}\right]
\tag{5}
$$
となる
### 事後分布の推定（カルマンフィルタ）
式(4),(5)から事後分布$P(M_t=\mu_t|X_t=x_t)$は
$$
P(\mu_t|x_t)\propto P(x_t|\mu_t) P(\mu_t)
\tag{6}$$
(6)は正規分布になり、その平均値$\mu_t^{(事後)}$は
$$
\mu_t^{(事後)} = \mu_t^{(事前)} \ \ + K_t(x_t- \mu_t^{(事前)}\ \ )
$$
となる。ここで$K$はカルマンゲインと呼ばれる量で、
$$
K_t=\frac{\sigma^2_v+\sigma^2_{t-1}}{\sigma^2_v+\sigma^2_{t-1}+ \sigma^2_w}
$$
となる。また、(6)の分散$\sigma_t^2$は
$$
\begin{eqnarray}
\sigma_t^2 &=& \frac{\sigma^2_w}{\sigma^2_v+\sigma^2_{t-1}+ \sigma^2_w}(\sigma_v^2 +\hat{\sigma}_{t-1}^2 )\\
&=&(1-K)(\sigma_v^2 +\hat{\sigma}_{t-1}^2 )
\end{eqnarray}
$$
となる。$\mathcal{N}(\mu_t^{(事後)}, \sigma_t^2)$をつかって使って次は$t+1$時点の状態の推定を行っていく