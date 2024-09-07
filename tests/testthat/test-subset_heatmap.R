test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

mi_matriz <- matrix(rnorm(100), nrow = 10)
rownames(mi_matriz) <- paste0("medicion_",letters[1:10])
colnames(mi_matriz) <- paste0("grupo_",letters[1:10])
test_that("Output is a ComplexHeatmap", {
  resultado <- subset_heatmap(
    mi_matriz,
    grupos = c("grupo_a", "grupo_b", "grupo_c"),
    mediciones = c("medicion_d", "medicion_e","medicion_f"))
  expect_s4_class(resultado, "Heatmap")
})

test_that("Empty argument grupos are detected",{
  expect_error(subset_heatmap(mi_matriz,
                              grupos = c("grupo_a", "grupo_b","grupo_c")))
})

test_that("Error with data frame works",{
  expect_error(subset_heatmap(as.data.frame(mi_matriz)) )
})
