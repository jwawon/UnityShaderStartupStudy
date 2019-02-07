﻿Shader "ShaderStudy/Part04/SurfaceShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows noambient

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;


        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            // o.Emission = float3(1,0,0) + float3(0,1,0);
            // o.Emission = float3(0.5,0.5,0.5) + float3(0.5,0.5,0.5);
            // o.Emission = float3(1,0,0) * float3(0,1,0);
            o.Emission = float3(0.5,0.5,0.5) * float3(0.5,0.5,0.5);

            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
