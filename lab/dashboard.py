import streamlit as st
from frontend.kpi import Content, Gender, Age, ViewsPerVideo
from frontend.graphs import ViewsTrend, TrafficSource, ViewsByDevice
from backend.constants import CSS_PATH

def read_css():
    with open(CSS_PATH) as css:
        st.markdown(f"<style>{css.read()}</style>", unsafe_allow_html=True)

read_css()

content = Content()
views_trend = ViewsTrend()
gender = Gender()
age = Age()
traffic_source = TrafficSource()
views_per_video = ViewsPerVideo()
views_by_device = ViewsByDevice()


def layout():
    st.markdown("""
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap');
    
    h1 {
        font-family: 'Permanent Marker', cursive;
        font-size: 3em;
        color: #6E8F8D; 
        text-align: center;  
    }
                
    .center-text {
        font-size: 1em;
        color: #4F6363;
        text-align: center;
        margin-top: -10px;  
    }
                
    h3 {
        color: #d79a81; 
        font-size: 1.5em;  
    }
    </style>
    """, unsafe_allow_html=True)

    st.markdown("# The data driven youtuber 🎥")
    st.markdown('<p class="center-text">Den här dashboarden syftar till att utforska datan i Kokchuns youtubekanal</p>', unsafe_allow_html=True)
 

    st.markdown('<div class="section">', unsafe_allow_html=True)
    content.display_content()
    st.markdown('</div>', unsafe_allow_html=True)

    st.markdown('<div class="section">', unsafe_allow_html=True)
    views_trend.display_plot()
    st.markdown('</div>', unsafe_allow_html=True)

    st.markdown('<div class="section">', unsafe_allow_html=True)
    views_per_video.display_top_10()
    st.markdown('</div>', unsafe_allow_html=True)

    st.markdown('<div class="section">', unsafe_allow_html=True)
    gender.display_gender()
    st.markdown('</div>', unsafe_allow_html=True)

    st.markdown('<div class="section">', unsafe_allow_html=True)
    age.display_age()
    st.markdown('</div>', unsafe_allow_html=True)

    st.markdown('<div class="section">', unsafe_allow_html=True)
    traffic_source.display_plot()
    st.markdown('</div>', unsafe_allow_html=True)

    st.markdown('<div class="section">', unsafe_allow_html=True)
    views_by_device.display_plot()
    st.markdown('</div>', unsafe_allow_html=True)


if __name__ == "__main__":
    layout()
