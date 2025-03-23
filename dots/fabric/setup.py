from setuptools import setup, find_packages

setup(
    name="deskinator",
    version="0.1.0",
    description="The gtk based python desktop shell layer for the master",
    keywords=["widgets", "gtk", "linux", "bar", "statusbar", "panel", "fabric"],
    classifiers=["Programming Language :: Python"],
    url="https://github.com/Fabric-Development/fabric.git",
    project_urls={
        "Source": "https://github.com/rootrim/nixtrim",
    },
    packages=find_packages(),
    install_requires=["fabric"],
    python_requires=">=3.11",
    extras_require={
        "system-status": ["psutil"],
    },
    package_data={"*": ["*.xml", "*.js"]},
)
