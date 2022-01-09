import streamlit as st
import streamlit.components.v1 as components
import pandas as pd
import networkx as nx
from pyvis.network import Network

# Wczytywanie danych z pliku CSV:
df_interact = pd.read_csv('data/processed_drug_interactions.csv')

# Nagłówek:
st.title('Wyszukiwarka interakcji lekowych')

# Lista wyboru leków z pliku CSV:
drug_list = pd.read_csv('data/drug_list.csv')

# drug_list.sort()

# Lista rozwijalna typu multi-select:
selected_drugs = st.multiselect('Wyszukaj interakcje pomiędzy lekami', drug_list)


#Tworzenie grafu:
if len(selected_drugs) == 0:
    st.text('Wybierz przynajmniej 1 lek, aby wyszukać interakcje')


else:
    df_select = df_interact.loc[df_interact['drug_1_name'].isin(selected_drugs) | \
                                df_interact['drug_2_name'].isin(selected_drugs)]
    df_select = df_select.reset_index(drop=True)

    # Utworzenie obiektu grafu z dataframe:
    G = nx.from_pandas_edgelist(df_select, 'drug_1_name', 'drug_2_name', 'weight')

    # Inicjalizacja obiektu:
    drug_net = Network(height='550px', width='100%', bgcolor='#222222', font_color='white')

    # Zamiana grafu networkx na pyvis
    drug_net.from_nx(G)

    # Układ grafu:
    drug_net.repulsion(node_distance=420, central_gravity=0.33,
                       spring_length=110, spring_strength=0.10,
                       damping=0.95)

    # Zapis i odczyt grafu na Streamlit Sharing:
    try:
        path = 'tmp'
        drug_net.save_graph(f'{path}/pyvis_graph.html')
        HtmlFile = open(f'{path}/pyvis_graph.html', 'r', encoding='utf-8')

    # Zapis i odczyt grafu lokalnie:
    except:
        path = 'templates'
        drug_net.save_graph(f'{path}/pyvis_network_graph.html')
        HtmlFile = open(f'{path}/pyvis_network_graph.html', 'r', encoding='utf-8')

    # Wczytanie pliku HTML do wyswietlenia:
    components.html(HtmlFile.read(), height=550)