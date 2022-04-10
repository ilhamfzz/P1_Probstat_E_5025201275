# Author

| Nama                      | NRP        |
| ------------------------- |:----------:|
| Moh. Ilham Fakhri Zamzami | 5025201275 |

## Nomer 1
> Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya.

Soal distribusi geometrik dengan iniliasisasi awal
```R
p = 0.20
n = 3
```
### 1a
- Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi sebelum keberhasilan pertama ketika p = 0.20 dari populasi menghadiri acara vaksinasi? (distribusi Geometrik)

setelah diinisiasi kedua variabel tersebut, gunakan syntax `dgeom` untuk mencari distribusi geometriknya
```R
#1a exact
dgeom(x = n, prob = p)
```

### 1b
- mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 ( distribusi geometrik acak () == 3 )

gabungkan syntax `r` karena menggunakan data random `geom` untuk distribusi geometrik dan masukkan kedalam fungsi `mean()`
```R
#1b
mean(rgeom(n = 10000, prob = p) == 3)
```

### 1c
- Bandingkan hasil poin a dan b, apa kesimpulan yang bisa didapatkan?

didapat hasil yang tidak terlalu jauh, hal ini disebabkan hasil dari nilai b yang terdiri dari random data dibandingkan dengan hasil dari nilai a yang merupakan nilai tetap

### 1d
- Histogram distribusi Geometrik, dengan peluang X = 3 gagal sebelum sukses pertama
```R
#1c histogram
library(dplyr)
library(ggplot2)

data.frame(x = 0:10, prob = dgeom(x = 0:10, prob = p)) %>%
  mutate(Failures = ifelse(x == n, n, "other")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Probability of X = 3 Failures Prior to First Success",
       subtitle = "Geometric(.2)",
       x = "Failures prior to first success (x)",
       y = "Probability") 
```
![alt text](https://github.com/ilhamfzz/P1_Probstat_E_5025201275/blob/main/temp/1c.png)
### 1e
- Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik.

nilai rataan dan varian pada distribusi geometrik bisa didapatkan dengan
```R
1/p #mean
(1 - p) / p^2 #variance
```

## Nomer 2
> Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2. Tentukan :
-  Peluang terdapat 4 pasien yang sembuh.

gunakan syntax `d` untuk probability density function dan `binom` untuk distribusi binomial
```R
#2a
dbinom(4, size = 20, prob = 0.2)
```
- Gambarkan grafik histogram berdasarkan kasus tersebut.
```R
#2b
peluang <- dbinom(1:20, 20, 0.2)
data = data.frame(y=c(peluang), x=c(1:20))
barplot(data$y, names.arg=data$x, ylab="Peluang", xlab="Jumlah Pasien")
```
![alt text](https://github.com/ilhamfzz/P1_Probstat_E_5025201275/blob/main/temp/2b.png)

- Nilai Rataan (μ) dan Varian (σ²) dari DistribusiBinomial.

nilai rataan distribusi binomial didapat dari `pasien sembuh*peluang sembuh` sedangkan nilai varian-nya didapat dari `pasien sembuh*peluang sembuh*(peluang tidak sembuh)`
```R
#2c
#mean
4*0.2
#variance
4*0.2*(1-0.2)
```
## Nomer 3
> Diketahui data dari sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis 4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)
- Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?

gunakan syntax `d` untuk probability density function dan `pois` untuk distribusi poisson, inputan fungsi merupakan (suksesi peluang, mean)
```R
mean_lahir=4.5
#3a
dpois(6, mean_lahir)
```
jangan lupa untuk menginiliasasi variabel `mean_lahir` terlebih dahulu

- simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini selama setahun (n = 365)

pada simulasi ini digunakan `r` untuk distribusi acak selama 365 hari dan `pois` untuk distribusi poisson
```R
set.seed(2)

babies <- data.frame('data' = rpois(365, 4.5))

babies %>% ggplot() +
  geom_histogram(aes(x = data,
                     y = stat(count / sum(count)),
                     fill = data == 6),
                 binwidth = 1,
                 color = 'black',) +
  scale_x_continuous(breaks = 0:10) + 
  labs(x = 'Number of babies born per period',
       y = 'Proportion',
       title = '365 simulated births in a hospital with Pois(lambda = 4.5)') +
  theme_bw()
```
![alt text](https://github.com/ilhamfzz/P1_Probstat_E_5025201275/blob/main/temp/3b.png)

- dan bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan

Dilihat dari kedua data diatas, didapat bahwa hasil dari simulasi yang diperoleh yaitu sekitar 11.5% hanya memiliki sedikit perbedaan dari probabilitas distribusi poisson yang bernilai sekitar 13%

- Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson

pada distribusi poisson, nilai rataan dan varian adalah sama
```R
#3d in poisson distribution, mean are equal with variance
variance = mean_lahir
mean_lahir
variance
```

## Nomer 4
> Diketahui nilai x = 2 dan v = 10. Tentukan:

inisialisasikan kedua nilai tersebut terlebih dahulu
```R
x = 2
v = 10
```
- Fungsi Probabilitas dari Distribusi Chi-Square.

gunakan syntax `d` untuk probability density function dan `chisq` untuk distribusi Chi-Square
```R
#4a Chi-Square distribution probabilities
dchisq(x, v)
```

- Histogram dari Distribusi Chi-Square dengan 100 data random.

karena menggunakan data random, maka gunakan syntax `r` untuk data distribusi acak
```R
#4b Chi-Square distribution with 100 random data
temp = rchisq(100, v)
hist(temp)
```
![alt text](https://github.com/ilhamfzz/P1_Probstat_E_5025201275/blob/main/temp/4b.png)

- Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Chi-Square.

Pada distribusi Chi-Square, nilai varian adalah `2*nilai mean`
```R
#4c variance of Chi-Square distribution is 2*mean
mean = v
mean
variance = 2*v
variance
```

## Nomer 5
> Diketahui bilangan acak (random variable) berdistribusi exponential (λ = 3). Tentukan
- Fungsi Probabilitas dari Distribusi Exponensial

gunakan syntax `d` untuk probability density function dan `exp` untuk distribusi Exponential, panggilan fungsinya berupa `(rate)`
```R
#5a
dexp(3)
```
- Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random

karena menggunakan data random maka gunakan `set.seed` disetiap pemanggilan agar data random yang didapat akan selalu sama untuk pemanggilan berikutnya, gunakan juga syntax `r` untuk data distribusi acak. Lalu untuk optional tampilan histogramnya, gunakan `par(mfrow = c(2,2))` untuk menampilkan semua data histogram dalam satu frame
```R
#5b 
par(mfrow = c(2,2))
set.seed(1)
hist(rexp(10, 3))
set.seed(1)
hist(rexp(100, 3))
set.seed(1)
hist(rexp(1000, 3))
set.seed(1)
hist(rexp(10000, 3))
```
![alt text](https://github.com/ilhamfzz/P1_Probstat_E_5025201275/blob/main/temp/5b.png)

- Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Exponensial untuk n = 100 dan λ = 3

Gunakan syntax `mean()` untuk mencari rataan dan `var` untuk mencari varian
```R
mean(rexp(100, 3))
var(rexp(100, 3))
```

## Nomer 6
> Diketahui generate random nilai sebanyak 100 data, mean = 50, sd = 8. Tentukan

inisialisasi terlebih dahulu `mean` dan `sd`
```R
sd = 8
mean = 50
```

- Fungsi Probabilitas dari Distribusi Normal P(X1 ≤ x ≤ X2), hitung Z-Score Nya dan plot data generate randomnya dalam bentuk grafik. Petunjuk(gunakan fungsi plot()).

karena menggunakan data random maka gunakan `set.seed` disetiap pemanggilan agar data random yang didapat akan selalu sama untuk pemanggilan berikutnya, gunakan juga syntax `r` untuk data distribusi acak dan `norm` untuk distribusi normal. Inisialisasi x1 dengan fungsi `floor()` dan x2 dengan fungsi `ceiling()`. Gunakan `pnorm` untuk mencari peluang distribusi normal P(X1 ≤ x ≤ X2). Peluang tersebut didapat dari `P(x ≤ X2) - P(x ≤ X1)`.
```R
set.seed(100)
rndm = rnorm(100, mean, sd)
x1 = floor(mean(rndm))
x2 = ceiling(mean(rndm))
temp = pnorm(x2, mean, sd, lower.tail = TRUE) - pnorm(x1, mean, sd, lower.tail = TRUE)
cat("Distribusi normal P(X1 <= x <= X2) = ", temp)

z_x1 = (x1-mean)/sd
z_x2 = (x2-mean)/sd
cat("Z-Score X1 = ", z_x1)
cat("\nZ-Score X2 = ", z_x2)

plot(rndm, type = "l")
```

- Generate Histogram dari Distribusi Normal dengan breaks 50 dan format penamaan: NRP_Nama_Probstat_{Nama Kelas}_DNhistogram
```R
#6b
hist(rnorm(100, mean, sd), breaks = 50, main = "5025201275_Moh. Ilham Fakhri Zamzami_E_DNHistogram", xlab = "Value", ylab = "Frequency")
```
![alt text](https://github.com/ilhamfzz/P1_Probstat_E_5025201275/blob/main/temp/6.png)

- Nilai Varian (σ²) dari hasil generate random nilai Distribusi Normal.
```R
#6c
var(rnorm(100, mean, sd))
```
