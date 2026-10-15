import pandas as pd
import matplotlib.pyplot as plt
archivo = 'C:/Users/USER/Desktop/PORTAFOLIO/Practicando Python/datos/VENTAS_FUNCIONES.xlsx'

df = pd.read_excel(archivo, sheet_name='Ventas_final')
print(df)

# Análisis descriptivo
print(df["Venta_Total"].describe())
print(df.groupby("Producto")["Venta_Total"].mean())

# Análisis temporal
df["Fecha"] = pd.to_datetime(df["Fecha"])
ventas_mensuales = df.groupby(df["Fecha"].dt.to_period("M"))["Venta_Total"].sum()
ventas_mensuales.plot()
# plt.show()


# Comparando categóricas
print(pd.pivot_table(df, values="Venta_Total", index="Categoria",
                     columns="Tipo_pago", aggfunc="sum"))

# Correlaciones entre variables
print(df[["Cantidad", "Precio_unitario", "Descuento", "Venta_Total"]].corr())

