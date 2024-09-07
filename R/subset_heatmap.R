# crear gráfico
#' Title
#'
#' @param x matriz de genes x mediciones
#' @param mediciones character() mediciones a seleccionar
#' @param grupos character() genes a seleccionar
#'
#' @return objeto "ComplexHeatmap::Heatmap"
#' @export
#'
#' @examples
#' #crear matriz
#' mi_matriz <- matrix(rnorm(100), nrow = 10)
#' rownames(mi_matriz) <- paste0("medicion_",letters[1:10])
#' colnames(mi_matriz) <- paste0("grupo_",letters[1:10])
#'
#' #librerias
#' library(ComplexHeatmap)
#' subset_heatmap(
#'   mi_matriz,
#'   mediciones = c("medicion_a", "medicion_b", "medicion_c"),
#'   grupos = c("grupo_d","grupo_e","grupo_f"))
#'
subset_heatmap <- function(x, mediciones = NULL,
                           grupos = NULL) {
  # subset matrix
  x_subset <- x[mediciones, grupos]
  # plot heatmap
  ComplexHeatmap::Heatmap(
    x_subset,
    cluster_columns = FALSE,
    heatmap_legend_param = list(title = "valores"))
}
