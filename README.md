# Author

| Nama                      | NRP        |
| ------------------------- |:----------:|
| Moh. Ilham Fakhri Zamzami | 5025201275 |

## Nomer 1
Soal distribusi geometrik dengan
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
